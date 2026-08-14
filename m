Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D96C5CFC1
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Aug 2026 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IWh2afsgnOjiJylfRTrNbEosxQ6VkCiQ3+dS4iCdgc=; b=wPY5t4DaZP7q17
	N9Gv7i4PsowIe4cnb0nIXSnw8roY43FMJY5dODSTsvpTKFwmJnYbMc8CU7w9gVrMjN3Le8a8yCfRQ
	mpJ5QwwMlgGOWkeJ3TxqcbIMecpy1xdaTp2ZxHg3l+XtYv7qYTlbizpRyzsjj0mEDUVUMrbqYCRvE
	d2/Rev4uo24YEK0bUnT5DKqw/Pq6iQoiXk+ttTK+fO7jEFFDn5n23M04Z5Qfs6bPuIlaRdelMEV2C
	6DxdMCqF+Sy7GSRFALM5Wc5aHDwplhk+/wncf9KAfp1SqKboYl9wKamjbmMAaKtDbiKC220Emghsv
	B251CP+RUloYznmZODHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvI1-00000002xDL-0C8s;
	Fri, 14 Aug 2026 17:01:53 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvHy-00000002xCt-2Uzk
	for linux-i3c@lists.infradead.org;
	Fri, 14 Aug 2026 17:01:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk2kkJGs3tH0J+gEjHhIwf1fcv2ZeXu4eeyDHGoJFbNBHaKymWWKSlDedZ5lWY/aJXJLNexcamVwIMawY9Vn0VKcLZFGiEst34BW0tlvgKGummFWBUoW5ruTNBznexZVHVpCu6qL8opnqWtG2G2tr9B/1KcuftXp8Gg+s/9g7PPYq9YNDn4QFcKxdudth1zYKMl3dxAR1v45rN5CQeJ1KJs47PBLmMvt+P3+/5KmLy2/ooxEdLj6KC8iu4qe46/f9hCgJSwEZb14wwlG3yNC7vuLA7nDbssTwSU+n4KQj6t8a1dQNWnDzinbvim6gVXg4Hv1KsYHxkVzLZMx3JgqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JMp5xqXfFRLNRGOUmeS9qHA9xzJDN3GDTlwNte/20k=;
 b=Zi3aGKYe+uVELGoIYFIzB/LxNekzYnWAy2Ikw9N0zAHGkUPYKY1JDV4jNZr+uvus797sd58VHbdXzVb68Jns7kJod/LDwCVtggamuPFyTZqqoAoWZoS4R9p9athB050O/TtlPvddkb7tfzCx3TOI8djcIhl+EHYStnv8tICinGIZrgzGsK843J+YTTzdMtwcPgNDS8lVAoi/4yCrtxlSW4W261tqPuxqV1gRxpc1irUzOpgOBdQWQt7kkvBeLRjDwXRAd9sRItJl5a6FYkTT0LuOZq8cYPoQNUR8UNNwI8NiUxdA7YO90+tCHMnEACHKlxZBKCb7rH6qXIPXUnqMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JMp5xqXfFRLNRGOUmeS9qHA9xzJDN3GDTlwNte/20k=;
 b=ZGMeoHayj84YI9SPdH3PyWA8RIhI6mE4uAWKcbIm0PIgd9KYk/PTtJY9LNK0UP73XJ5/oKiYKX6JmjmQZ4k+M71pG9kUuwlHhOaD0WdsPDa0WKg+Sb9k6/H1Xn/BwG5ik9nRRBhBFWBSb9oLEVocpD6yV+SjwFOp4episKN0t5Llk1bQ34tyCWMcq0nrFdKgHeCwKt7CjDqi1UZ9RrMFG0/9D3jo4HScMOCr//p2dc18t21HsWQys4e7u0KhqeMP5jWbk9rxUh/MruMaKgohZc9CcmdxuFsCiS4Z05a6F6b0UXRjnV9ywwEImaqS8ydiaYl+rXeJndlIcSnOIMd0sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU4PR04MB11754.eurprd04.prod.outlook.com (2603:10a6:10:626::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 17:01:45 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:01:45 +0000
Date: Fri, 14 Aug 2026 13:01:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: dw: rename "pclk" to "apb" to match dt-binding
Message-ID: <an9J4RV0AuEgokxC@lizhi-Precision-Tower-5810>
References: <20260814040345.23033-1-jszhang@kernel.org>
Content-Disposition: inline
In-Reply-To: <20260814040345.23033-1-jszhang@kernel.org>
X-ClientProxiedBy: PH8PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU4PR04MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: 84808bfc-0960-4f9b-b7e4-08defa25b079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: iV3Y0H+s9GmXI1on63n7QdwC7TnKi7a4eCugF2jj6ko6nuWvN6XD95zyWKK/2XJJKxxByxJRqAZFRtT787uAYBwjZ+cLsBW+YEAlfbF7wwVsdCKzpZh7ys/r78WQXXH57fFGU7ybk0moHZW0eh1kLrKQAlTmN/5u93NVd4/ty1BN0772mdDHF6q8DWGqCzBkkdtMS04re5MkHQulgRPtMWBnlPe+bWKzz/DsYxSvsS7FDod51O7r3fc6bXdStPsvuMVqi8U7Ky919NMfxmZNxFGgNxTidDCLsof2QkN02mpALltSMRZDRUuJXWL+WvCx3eYgX8ru3dDbFEXuXDdAcIAoUUFhq9xKmTZ/ZvXKSm3KVaZFf0cXYrBmpYeEx/F79DUXXK8jZ+HVB6cy2a20QiHKiSZKFE6VxsAoCkVgTp0fE0mquCTCbZtSRnfb+h7zU0Us5GAs1DWoWNijE3bOz9ciod46SXexXnpK740EyqSclPQYBGJAr49Vm9Z/xEwaaf/qDLswWSxqd4gnM9RuiliMpOZTD3f56mxbqqJu6m+TbxCGWUd0weXzyF42hc5m5+8zrG/T9XdfubhRjdk9CfhyDDREK9C4yivkf6mTYJ0oSoXoPIhnEFQBYypeLI+zrtr4wWRSBRXDVlh2PQGAUFByuf/Vf43zyg0TbOp7eZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g79duZ+XKeAHV8ZSn1D9Ww+G2ZzkYiMW5UkIGpAod8ngMEkaAMwu4Eh3MEeA?=
 =?us-ascii?Q?B0jn2yTH6q56p1No898psmjtFKXehnyZoDqt92vDca5eGkU2CiWZJbUWCw76?=
 =?us-ascii?Q?REzi2HbuY2wg64XKecwbSRzjCT2Vf7kFrbUeYypvJTtPtJPU5meO+9nBUS55?=
 =?us-ascii?Q?z75OJagNs6QMMbYD8v43Mc83wFAKYYOsIqzPOkk05ti8ismQpfRYXVTe+Y0k?=
 =?us-ascii?Q?ZG0iLIH4e0wc/7K0g9GiccEBMAuGSH+JhOSc6n4Edbsm/UcemluUFquqgY03?=
 =?us-ascii?Q?6eb+rO00BzxIK8WrGKrrXCh79xVt77vrRw+W4RUTEB8sph5+WjkOp+bRPXTN?=
 =?us-ascii?Q?lfA1K7tlsqIFRj0zfMJ6GM5Bci7Bt+l2JZEb8NgqVxCUQ8iw3Z302jZE2BQx?=
 =?us-ascii?Q?M7BDExuVrS6yGEkWZ5c8G6MsyNarZJPI7DO5BtwYu1UBjK0exBjQxl7ZGSf2?=
 =?us-ascii?Q?n881VweoJFsS62zNYMU+7c6K562pZ/owhd/RBow+zWasdDHbv3qpnBEvpLkJ?=
 =?us-ascii?Q?i0OzCbJE40V77vqMwV8mVNQqSCSngcdNJFlQ4xWKi11NMFsbqDBJtO5ZBTyt?=
 =?us-ascii?Q?8LQFKTFQ9r0DtcVhDv/Z78IGyay2gEa+Ho3g/Lkl1smrFBnJCJyUUynduzbc?=
 =?us-ascii?Q?jnJ4x7bGiK/G7ApbGn4ZxL4RlxcL3OmJVuDTFw9C1+W+PQS3JnNkaVzi35EN?=
 =?us-ascii?Q?7ysUGMglNN5KFHd/NVkhyrumeZ+idLadwkT5NgiSU53C9z1xpZVFIX+Mj5Wv?=
 =?us-ascii?Q?dUzAMbE57ObkRy0KdcnUvoASV2xvwo08MdbSJDI4RMkUf2wUDCe6Z0gO7bwY?=
 =?us-ascii?Q?KX3Z6GgTWXrKvc6xpd+3LyGmIDalTonwXOg5Ac8eT/TiXL92Q8h0lM84vfN6?=
 =?us-ascii?Q?FBCrhsWzFQMb000yjOTfcCErla0+3wZqVSao4BTRvS/sCQlfp2HhpSs/XZ5m?=
 =?us-ascii?Q?TYHYQTJoorX8QY4ItnamfOBr2sPLxuBOPKVFTxiYXxxM9iIssKvN7VmOXngG?=
 =?us-ascii?Q?fv5vd4R/pe/DUYUrdVMsZeOJigP9kPMocA6+ukU0I3+7rZfwiP2pXyPT/NVZ?=
 =?us-ascii?Q?lWsPMy8+r6azGxmGr2Ywp3/UZLXLdoTDMxPo7H58hB41X3JTh1TwRiw+Luls?=
 =?us-ascii?Q?B4shC449Bifoxyij9gp4cUH/wMUoYj7SefBpD/5KdWBWSu80TpGnZ3yKkcPz?=
 =?us-ascii?Q?YJ/mDMNwR/h2SzB8I0q/V9RrOiu21N8UxZiOOlEs2aom1D/eTtFrrIj/xyoA?=
 =?us-ascii?Q?JtcQePNQZlydZoiJcXU4pzmCJwNQ8wIiKYibDMnkjx2AFYxWKcffWfuVi1TE?=
 =?us-ascii?Q?gO76r+wxoqGAr0TC44OR/sVtdl/PItmvp/WuFNm0yLyMUs7FMF+7fi0DCz+F?=
 =?us-ascii?Q?A3lCXtDrKISlZAM6Z13gxv3dhmm1sYXxp43E2ZeFYz4TILArxTQ+goXImJOs?=
 =?us-ascii?Q?dQkS/FtmHwgiR69aLtXQUIOif191jDDrQ3kxW31WubodyrsTdu2K3P2XMbaZ?=
 =?us-ascii?Q?I2xqEjMIXcsUBzry9xCTAYSgMHu8TCGGx8SiyMfQvCZuw9aABCsgPTIlgaUU?=
 =?us-ascii?Q?PwQq63oUJVnfGrvqSACbKLrXdTrLwgYFiza6sFbOWubyiSY87AToHt6KFxmo?=
 =?us-ascii?Q?M8dvP7wyIQSnDbQSj4NylzUiBBJd2AP0K8oXAa2Zn8BCoLmvNZnchwXpu66M?=
 =?us-ascii?Q?TPu5WiMULtQ6ZKL6ZXQ/x/WokIsxqbpkikejpm60rEB75lNFCXTS2T7x2WCX?=
 =?us-ascii?Q?JbsLE6iOjAIIpc6jwx2xwTIucuuMEneMwleThMJim78bWew4dgCw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84808bfc-0960-4f9b-b7e4-08defa25b079
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:01:45.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2vXcI41xk3bzOFj4lhK8Ypb2dIyiC6P+XIcY79k2cPpwOisoy3YockKgkQPQGHpC6MbtAOhY4YP6k3anjvplmzPIjevqGCxxhGiv1o8Xuyp5Aj8WL/0O8d0w4KiH7VY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11754
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_100150_639593_E3B29A03 
X-CRM114-Status: GOOD (  12.75  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Aug 14, 2026 at 12:03:45PM +0800, Jisheng Zhang wrote:
> Change clock name "pclk" to "apb" to match dt-binding doc. No upstream
> device tree sources currently use the "pclk" clock name, so no any
> backward compatibility issues.
>
> Fixes: a0d48ebf39ce ("i3c: dw: Add optional apb clock")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> since v1:
>  - update commit msg
>
>  drivers/i3c/master/dw-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d6f84f0f4c2d..1053cfb05c05 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1582,7 +1582,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>  	if (IS_ERR(master->core_clk))
>  		return PTR_ERR(master->core_clk);
>
> -	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> +	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "apb");
>  	if (IS_ERR(master->pclk))
>  		return PTR_ERR(master->pclk);
>
> --
> 2.51.0
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
