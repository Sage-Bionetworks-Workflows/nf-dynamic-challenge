#!/usr/bin/env python3

import sys
import pandas as pd
import synapseclient


def get_submission_view(view: str) -> pd.DataFrame:
    """
    Queries provided view for submissions. returns one column dataframe with submission docker images in the following format:
    <image_name>@<sha_code>
    Args:
        view (str): Synapse ID for the submission view to be queried
    Returns:
        images_df (pd.DataFrame): one column dataframe with submission docker images
    """
    syn = synapseclient.login()
    submission_view = syn.tableQuery(f"select * from {view} where status = 'RECEIVED'")
    submission_df = submission_view.asDataFrame()
    images_df = submission_df.reset_index()[["id", "dockerrepositoryname", "dockerdigest"]]
    images_df["image_id"] = images_df["dockerrepositoryname"] + "@" + images_df["dockerdigest"]
    images_df = images_df.drop(columns=['dockerrepositoryname', 'dockerdigest'])
    images_df = images_df.rename(columns={"id": "submission_id"})
    return images_df


if __name__ == "__main__":
    view = sys.argv[1]
    images_df = get_submission_view(view=view)
    images_df.to_csv("images.csv", index=False)
