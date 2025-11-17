Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40920CE8D6B
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Nov 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUifq0NiAx0TZMQZ3+xoE6Ksgh9JkSNkHHsQQE9a7Ps=; b=x6daUnajeCH13c
	nbat+lFbzAYGS2TS7787mokMyEe77H1iZrZSeFmXYOGm3aAtfWCRr4g1mUfP9CrUbds0bSmHAzXkW
	dxoZJjJ4Oordpq2f60INkMvbhCollg5gO00M7GEIRgsNzX54SI+D0tMue0TcuETfHY1Hb9i+LJYuw
	NQiww19+Un+V8whxGb/FRnRkoEgZaFlQ+7GVnrgAVejxxyAhSSfC+/gdPJMqVp9TDJykBDmVCbvAe
	mTrcqFH05Iwrkc9ilnhETwE5M8zE9q2WH5fgMoLHQdrDzPbJcZvrutBkyoLinx4FK9bykeKMZcNDi
	2BVFmj0e/nR08xB/TeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1I5-0000000GL70-059x;
	Mon, 17 Nov 2025 15:37:17 +0000
Received: from mail-northeuropeazon11012055.outbound.protection.outlook.com ([52.101.66.55] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1I1-0000000GL5D-26M8
	for linux-i3c@lists.infradead.org;
	Mon, 17 Nov 2025 15:37:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ7+pJx8hVMei2IJng5oM81us1jtij+kdQWBN/16FLLBCksskaVt9valJBexATMDesNIZb50YhiecKNM12Sk401vss3tCGW6Q1yfUAnawKl+vW0WMyzcbVtJ0KkcLth9v0MrUJc2RO1R2b1vTggQAQidGq3jK5AC1LuLCpTqgpJz9aNxo+cWCr0XgevBvdp0fyNBqt1kg8UcVWK6+p0I+YMWNE9gm8O4Fi+Qc46aZzR6RGXzWiv5F9wex1G9RNG/kIKBzalTH2UABJGVdwmv++HxlnMava15YWdEu6a7InznSXoJawM5HB3en+ABtvfMMN4+JcjXCQp2wBxh4ntdAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPt5VFIdH+dsbqggRTHCOBzufK1nrtjppCEPCAVcxTE=;
 b=xpUhUhMgyTx2mzwBatAXFTdt9ZYFgMYUqvUTiiVcWyd6MLrbVhLGifn+uRSspe6ADmZcW8WWwkciGzomZ/Jqox62Q7nBebq1HqChACcvXQcO4MOP9KFQeF8mjNW6d4Az3IVP+F6rotVuV/r2DuF0nBGqXKsgAOFNrc9XxFNkFC8LfJ9PRBsir7fxJ6Mj41SSEHQaf7mgrk7Amhe7l26D2bYLL3nEkBvxaUXJCQsZo0kKTBDCduorPjWXIIJWO8wO5nIZu6kqpxbIaBO2hcTTJ+vcE10ZBjTPP2JiHmZ0iGAx82vmHiq2MoBOWHXXuu/6Ms5tKHteZroYFlQKXjIK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPt5VFIdH+dsbqggRTHCOBzufK1nrtjppCEPCAVcxTE=;
 b=VB2TxKvo09xHoGDw6DC8qnCfVS1YdALeKoCBlqSFQRxc57SXMMCBfKJr1jZqfdeVP3GEximjb87vYy6l+K/NQe0UfQmAU/a7k6wXlS8Xnw2P7evIULSkWYxmziShcVOT6ukZvkYiqRHaMPp1B2AW7xm28RPXjUB4ls8heIV3NKgIvAnHa8LBz1INnVq6PzzQ44eERHNh8yZ/nhUBDta/dnqPasFnn7D0uf+7L86+WHdXFCdb2AFoPJ78RP73nVR3A6EmqtKF16PSuYt1idDwFlwzH/Z8Ti7C87Ip7HaTz3kyoozbv51biPIDLvo9yc/o2SYH/k/XMoihfsON8z0Tig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11448.eurprd04.prod.outlook.com (2603:10a6:150:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:37:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 15:37:09 +0000
Date: Mon, 17 Nov 2025 10:37:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 10/12] i3c: mipi-i3c-hci-pci: Add exit callback
Message-ID: <aRtBIIUEbGAqzFEM@lizhi-Precision-Tower-5810>
References: <20251117131609.65988-1-adrian.hunter@intel.com>
 <20251117131609.65988-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251117131609.65988-11-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::11) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11448:EE_
X-MS-Office365-Filtering-Correlation-Id: a6f98fff-3c0f-4ad9-cb58-08de25ef2bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5mLmA42QRISADAj+i44GNVftlEjjLifvjg6fTAO48SlNqjUIuDT56zJA2x6a?=
 =?us-ascii?Q?aiEmasvemPxN7Y/0t3KrCFaGpFTHz1ziD36bQVXNVYkpc+Yi56nAFmtr2rpi?=
 =?us-ascii?Q?R7GQlpes7YzoSyb6L9ts7kFm4/nIqds8X4wl1c3sZbeV9LeGSXpq6025Iytz?=
 =?us-ascii?Q?EuI8S1dMDu1RGcaff1KXazyMMnhdynNyaigiThF1mOtGm3vSD0PZKhszjRU3?=
 =?us-ascii?Q?zSo5yek68ITHOj9dRoRLhBsMiOZBfFDt9feSi19aRILhyt26Ug1jThfsf6gc?=
 =?us-ascii?Q?UJzB68YlBNw+dWwTrEw8sHAlf3P7e+WSN2qr1Sa/2nR4tVLjy7fUL+xQ2ntt?=
 =?us-ascii?Q?p3KsSxEh9gqsF8vEqkTscy+MJXHzJ7kIEXuUId8TkNuzXvnweFom1uUGYKJc?=
 =?us-ascii?Q?RpynYgjCfmu+aUDgwP90KEAeXejWLSxk8G7NjXgby9L8/tIUHQjdM3SgudJQ?=
 =?us-ascii?Q?zoi310+7ewMTckO5dQmczG1/JXWh2buuXefu4iHdScDP8CJlZuaWNpriiiuo?=
 =?us-ascii?Q?+swxfpCI18iCUSRgVcHA+VtbvBRZrTLOqlmxgmxqVP2pxhNPvWx8xKM9/e3Z?=
 =?us-ascii?Q?vBqNoW5v/EsOxZVPBooUh8LkArlti0Kdr256bR3v/AgzlOqUbgQ7CQcddWvg?=
 =?us-ascii?Q?hDM7R4+9sHV+O+CWu5HiOJOcMtjNItbAn7t/G/ywlvwoP502fb8306y9Ll0a?=
 =?us-ascii?Q?qk8Dup6eC1uOathFMFQcPPSWEGYI/eYtjdu6UnmMmOA6E3RQJlgmlH+/FHRd?=
 =?us-ascii?Q?x2d4vReBBopOo1zAnmknqHRY5CHw4IHRhdPpaam8eDspcQcusdCgq5xZOK1q?=
 =?us-ascii?Q?fODSXV4HR0g0LbHR/Bo8be1i3tOUCs/q9Tvr+tg2KJKAsMR2+2ag0Swn/URb?=
 =?us-ascii?Q?+lkAYtyGFwCCZI7hd+JCaMUQvDtiOVosjDxHnw5CHiUExjaKWws1zCczhAQG?=
 =?us-ascii?Q?Ncg3vop1Y5hp/Ys8dSf5b9udAxjt6MUg7O9ksRi/hYZ1cgcCZLJUw2GLnACY?=
 =?us-ascii?Q?OF/6RDYgywdryR6+o36L1KGa0tWQsP7yDAxpL1UZP6lPrrAbn15gU3daraIv?=
 =?us-ascii?Q?1mRd3c/9/MuALSEY6fq+3rZM6OC1Dh/2RNx9ROB52Yxfz4Uxon4Rc4eotidJ?=
 =?us-ascii?Q?CMQs58BFypnLTMy4S7FUw/HdLJ139P3uOfkGeK0BbX6xBALUwsigE7cb6pT9?=
 =?us-ascii?Q?Ipqe96Dc+C4UxViQWEo1LbPufZcgQo8vyULAoPSLS/fvMidwBaqkY6MAlIKC?=
 =?us-ascii?Q?14XJb57KTG2JnJilBz/5xBaohE+1Ryi5byplw6B/Jd2+2GoHoZfmw5ONQrTj?=
 =?us-ascii?Q?WkVfmLiRWF0CZShqoNbQzZ7Vp6o3eKRK42N6ZlH/ESCgDtD7zRSrNStLsL1z?=
 =?us-ascii?Q?K505mf3Fq6cSLRQE28UE4/od2faTX1qow1sne0WDH0VkuPrD91twFS7ECxgi?=
 =?us-ascii?Q?DKz/sTmduSAG2zXgUJZ82Y3GPwAq4kWfB+0JpZNlUTtLwQWReKCO7sc8KJKy?=
 =?us-ascii?Q?vK6vvn2deIVtLf+VumWOAKj5Pcq1Y4Gc9wFR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X8QlME5PmlPs+xCqRQiRcIn8E55Di2nUeHtIWoYFE9m8FgWs7JIuC6jgPXOg?=
 =?us-ascii?Q?YwrKI5PcRZsvtixsPObZbvOjALGiAieSUCs96A1U9qFms231Qe+SqNZrrbG6?=
 =?us-ascii?Q?8/ji7dyHCCpiiBXMY1/1cvd1du4kEpN95VLGXnimrTc5wSdQcUQlMpeGRQ2e?=
 =?us-ascii?Q?ZmvhtHKw3S34ETuznLgja0D5VT2v34vuA/P/M1Y6wHku4pfXXAr/WoQhjYoh?=
 =?us-ascii?Q?eXQmz8OiXphF7fGCp7SScu4yba+zOejowZN8c/pigT4xw7unZcyaO606Nv1t?=
 =?us-ascii?Q?wdnynhlOosoy+E8RFZHO2gs2/evdl7G5OouU5OHU1Xb/qFqjRnck7rTRLB/2?=
 =?us-ascii?Q?jAozhvID2R5g9nLFpNa5fZnfGoJDnVVzV2PXTKy5u4ZqbVN0QuN55Jb2bP8t?=
 =?us-ascii?Q?Y/NRHmbN1kpxuTGx/UWO3fmNMoIg64ZZveMOO1CNIX74DjpVuBdowvksTbjS?=
 =?us-ascii?Q?YRvLZtoTb8bkq1rgWLw3YHdTOUzUDMSgdIEaHcaT9e2KlSdOr2K9vFh9Z0qP?=
 =?us-ascii?Q?ybNuusNzqtiycOtS8utfKDNgKpfdH9nFvX/1rVuOa9gQ0HPhd80tGArCsOyF?=
 =?us-ascii?Q?eaonQRnGTGXdSuWuS/Bvuo6BmRH5Ww2rlGX/Ntfqc32Bbac717R9xDL4ZyBE?=
 =?us-ascii?Q?/cGKRmD+l4z1DhJ4lRg6Ta0Om8YBfUcoLBHT5iEpGvazStES3vNpFwny4JKO?=
 =?us-ascii?Q?ziJIf3z/DlVMa4sQB3GYpJgKACPuScdoeMqi7JCFTAlBYzJiaBvsY1+SzVbT?=
 =?us-ascii?Q?4Knq38sWwTYkuGinOUF2VgBb3rMTLlKpI7aTq1xfbyuofHYTxmhXvR5vaCzO?=
 =?us-ascii?Q?r35zvJEy6v6+2KNikZbugypPaqmutOuxjApTl9MTTiye0dTf8Q5Wht00edln?=
 =?us-ascii?Q?INz+BVhVsnIhn6KEsKv5kuR7sm5pWZjngxIzmlI4jircSrgKQBIZE++bftOC?=
 =?us-ascii?Q?SoECO7gvbR6LOmP4W2nDeHtwwyxb1FK8j1FTJoY6g0xKjSTNxnQO1VajXBxn?=
 =?us-ascii?Q?Q0tNog74l0RZq56/45L4DqDElqXeEH1IvlVwHxKBX7Al/T3nZZrxgDNhTYEd?=
 =?us-ascii?Q?k3JV9lnF91H9rWhkp+2bb+YHh+5eHNmbUIHmyrVa1fHT6zqvfUVQsbJU6s2z?=
 =?us-ascii?Q?3rKbOr5gcGYVVl3EDQShKq8glUvV5EyZ8FCpgCcgFHzg7v1uPM+BdmzqXZhB?=
 =?us-ascii?Q?RWIC0D91+jlUXmqwIGhI2dFs5YPLdYKD/1JmPuNi5TQ+ry3iJAuts2qLN4n7?=
 =?us-ascii?Q?oQF8UeajudPlJJD8J7wEQgMMeP+lY2gW3rJX6iPcsGC9MdEFj4asN41cnTNt?=
 =?us-ascii?Q?1H8SCy7qy3SsEWJPw31sc/HRirzoExvbTXURZdxJ/EZGUaFipH1LhP5eQbB6?=
 =?us-ascii?Q?nNvSju2pXcoZ9AGMdZ4Dj3BLHhCVH6EIpUgewjd8hzslQ2hepQp5UYFur6SD?=
 =?us-ascii?Q?MGw1yxX41k8dSj1am1Zhv+1mluaGf4k6goQ2yqMyChG4ahV/GnWQCKT4uhd7?=
 =?us-ascii?Q?toYRUeUBaGzm3SlUmt6xKxSg7v7SUzGVNNV43ciJstFlEkfM96+qPEih9Gkw?=
 =?us-ascii?Q?HL7ZBWBtmQbFHfhYMvk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f98fff-3c0f-4ad9-cb58-08de25ef2bd0
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:37:09.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6YL+Ow1MzNzEUXbrzdOWzMIAUcYFPR+0+MmNCCvNvTEUXhvpdNzq4pTGa0oBMBedPNjo6Luz7r9Y+EqZdCBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11448
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_073714_577325_287722F5 
X-CRM114-Status: GOOD (  20.39  )
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

On Mon, Nov 17, 2025 at 03:16:06PM +0200, Adrian Hunter wrote:
> Prepare to add device-specific features that require cleanup
> upon driver removal.  Add ->exit() callback as a counterpart to ->init().
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Improve commit message.
>
> Changes in V2:
>
> 	Re-based
>
>
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 7bfb9fe337b6..b962d3c2d510 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -17,10 +17,12 @@
>  struct mipi_i3c_hci_pci {
>  	struct pci_dev *pci;
>  	struct platform_device *pdev;
> +	const struct mipi_i3c_hci_pci_info *info;
>  };
>
>  struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct mipi_i3c_hci_pci *hci);
> +	void (*exit)(struct mipi_i3c_hci_pci *hci);
>  };
>
>  static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> @@ -72,7 +74,6 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> -	const struct mipi_i3c_hci_pci_info *info;
>  	struct mipi_i3c_hci_pci *hci;
>  	struct resource res[2];
>  	int dev_id, ret;
> @@ -114,9 +115,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto err;
>
> -	info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> -	if (info && info->init) {
> -		ret = info->init(hci);
> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
> +	if (hci->info && hci->info->init) {
> +		ret = hci->info->init(hci);
>  		if (ret)
>  			goto err;
>  	}
> @@ -141,6 +142,9 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	struct platform_device *pdev = hci->pdev;
>  	int dev_id = pdev->id;
>
> +	if (hci->info && hci->info->exit)
> +		hci->info->exit(hci);
> +
>  	platform_device_unregister(pdev);
>  	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  }
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
