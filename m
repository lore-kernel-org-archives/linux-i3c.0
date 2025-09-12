Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD04CAC582
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19fkxTFZEeDZpqfxVoIiV6XIN5duThPr78p1exSOeTc=; b=qqEpnhOBzsoQ0s
	QoaGtsZBWvE69iuCBls61SturFV+1gliVl9J7y6jpZ7CPzaRqJ1yzBE5kdq2msvglfwiNBdQ4dxUO
	mkSsPVdoBIMMmDsvczIylHeAlp7P70K+qCVH/0J5s0wDK9Llhk9D03uBgfDYMjqAivrVnFJEXddZ5
	YjR96NjwQM4lSHy9bEsHiuEe4H/icaARtEbEBdNJJVSguaNSGKx2BdSPVm2Baas+qJ36ahSb8O0EE
	af8SNlCL4m/vNyO0qnXL23WkyHwKahY0tCDKbUhLG3izCcOLZBhSqIihp9rH9h8q9vjwWoRsgEGDe
	Rqk3Tj+UaHc2rAmWFG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4h9-00000009rXo-3xfo;
	Fri, 12 Sep 2025 14:24:11 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4h7-00000009rUT-17K9
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 14:24:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5rGyLcc7vr5ew8jOE5RbOO6D3SrLneeMS/p90v6FFMDeb8XBeMuj6dfgDLg/bdTTOHA+WHYQTLhHGt07Ce39Bn+rNiQeoX3/yiEacF2+vJlM3gpBDgOyl8SlTIa40FBYQawZC7eC8QChxoWW84fvOSAQUtKdwvT/SmWWrtJeuGcN+tuEQG3GwKiEskadFigiaxTPQLktq+h4mCmEiCcY8i64ZLJUTU0wdET9xHwURrO+OLTbFWUeB345hkDkG6R6svhzEE0l9bbH/ehH+iaT/U2wFXcctV0i2rF4TQPktzyc2GBzpHXfhH9yit9G2oKLy0uolDBNUeAlLsSkLCG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwlloNKDuHoejeMwrQXPoLvtV2BNptYxMKBdsqSVJEY=;
 b=n2dV6Rif+YA1lqx0mZ2zXe7ozLVvtuF8USHAtVldG/Kj2go/87+VBN/Vw+90rdIbs1ixprZAAnwafq8zvybLrzqRy/SsB3v2Xd6qIeCQbKHqMklB+3tHLaYdLOutjojcJOKbUDN3jOatJcWt+D8XY1VBp/RgbZ2YvaZDG3RNbyWXzu5Fpk1QZOJYkQkFG7axNbmTVKVqG9T2K7PwjZR66LwvxXMVA4zol/WMAEN7EaiMB0XkbT+mAcrbevwYmVwg8+vhoSB2k0guP8uZv3BnG6vEcudzkxMSt45d4HEfkOEq/E60UAZUCp/oS8NtX+xqRiFCEbKkdLLBzvMTuezwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwlloNKDuHoejeMwrQXPoLvtV2BNptYxMKBdsqSVJEY=;
 b=ZMXBlWwsZKdiWPbUwD9pFFGduzdTI7IU2M7welD42jhVRtQRDe18JNrJKAjak39osFC2hcubRI1NH1U+/QkcL4TzdD6b1PKgCzSFgQW6Uw7o/xikIEeIt1dmVGq910sdXBnNMIm+GHDvWs/44WHQSfin9q8d+hVZENBtTm8sVlF51o28F2eFa1gMIUruv1g55gJNuWgJuN7b0RJb5eXMvJGpcp+H0VBoFxTcuVGfYqTqeSKLNAADdpF2X6+vQwVnxfjyxtcVrj8lIm1oe46tYNskV7F4nz6f7pd0CVyyv8WNMIQsCj3kw5d+i5DghccgsOfNxlXVmJ3xLPBa7L5/Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV1PR04MB10990.eurprd04.prod.outlook.com (2603:10a6:150:209::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:24:00 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:24:00 +0000
Date: Fri, 12 Sep 2025 10:23:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 3/5] i3c: mipi-i3c-hci: Uniform ring number printouts
Message-ID: <aMQs+sCTMBKXD23R@lizhi-Precision-Tower-5810>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-4-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-4-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV1PR04MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d33d6a0-6897-49e7-7259-08ddf208042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|19092799006|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3PUj53l/w3JuL1A6nIoC51eqQch2Gh22mnh6WHO0xoF1Ni8S7z/LPCWI1tpR?=
 =?us-ascii?Q?jeI3X/rT9dgIzMAVmhqOOZj0N9fwHv2jlnQ+LfTIlq/0a+bxDSJrL1grBzMH?=
 =?us-ascii?Q?IA3JFs2ghkDmTqRLnr8qZo/AkKnMN0rXWpt9/hhxf2KyX3CJpiV33H8Tx0Wj?=
 =?us-ascii?Q?WB/nC9bCdewlYwdDcUHZymjEy9QfdbwWaq0MlzdE/5dqPrgKsSA00iaHjZy6?=
 =?us-ascii?Q?ty0hqMID6l0xfUw3unP7xJWLzCt23gAbgTe4uolZ8J1XpJDNc0KONMPhLoRO?=
 =?us-ascii?Q?MLLXL16g6lhq753SptxKBqcHnH4UXlTm1Zp+nzIiarzq3Pe0GDLJI1MipUZE?=
 =?us-ascii?Q?Yv0ie+LUoK6jCVR7acWJndPZaRDhJsQXdgSViEjcXkt2IzJhQUu+yKGlm2al?=
 =?us-ascii?Q?Uvjv2x55ejlBsa9NevPRwIjjBdQ0yu2ykgDHVXaWSTOj0FdQ+TLPrcWGsVOs?=
 =?us-ascii?Q?UA5NKVbDabxZs6Nngb91lIA7CMhyZ+tc9tvRxK60qgnUnwrQ3Hbt6jLoyBpM?=
 =?us-ascii?Q?E1lwEjqrirBvYctJxvZiI+wYkdVivM1LwndZWyA5+dtMhukGtCHoc8QXKPHL?=
 =?us-ascii?Q?7lzjRtZ7zVN2eFKTaMYvJ24WRkgC2vh/sgnll6yW2tNbTNYqTIpugyZDz+N1?=
 =?us-ascii?Q?LGR43WwhPhmxOjm0bKD9rLVsKzoKzYC8tqOTTB1UuTL7cydXnWgDdPQ50cs4?=
 =?us-ascii?Q?GO9d+oUZPkK5Egs85FeEa+dumJWdPwmsGUhm8RyG77Ttg0WHuWAtMzCyPu27?=
 =?us-ascii?Q?IdJWw5QFdc6GpeRXnC35/NBVMxNd9lRWWzZvGrB15M7aS88qU/rj/jeWH9p2?=
 =?us-ascii?Q?DKyCP9tabar8dBsebHf/Ia3dquMX1Ls0jPZNTcm8EPVxpZxuxQMF+12tJN9P?=
 =?us-ascii?Q?EloK9/v3Qs01qBO+WR0DYfQFdptCU4YcLJtqarb3Ajt0+u33yixJIpYcKvje?=
 =?us-ascii?Q?wTxgCrfJSMYRZuj92PP5SJ83HJB+x9G9DEjbNUu1EzSKbNZRyyp6FToCTJwj?=
 =?us-ascii?Q?Q8m7ZZqUQCL9PsqgYZZNdVRN/49Jr/hvX0DFsUBr544f9XJEUpZg6U2sc2XC?=
 =?us-ascii?Q?Xtyha223s+7NffltRmEUnT6q1aQwACW3b5GiZdrXll4yzyx4HepmrytMpxhM?=
 =?us-ascii?Q?ZC9tKTYnypqkdBQUcXLcshDuB0YtOrAwcKP3tNHlT4tjU+BfgkVJrdOZlvsQ?=
 =?us-ascii?Q?2C/9glfui2ItJ6Uehyhllg+77YCXdh1qPXilJy7k8oOwJJdNV2IYuXvj8Czt?=
 =?us-ascii?Q?V08/BJbICWq65SemwQUS2Q5cD86u+1e2li1wiR4UZBEImCgo5rK22A1e0MfY?=
 =?us-ascii?Q?TS2Q7PnVugN83cOVPS0dBeQCDgFBFKSZgpapQU1Pti5msnY9KKWK4EmJBB6Z?=
 =?us-ascii?Q?kcnfPg67i1tG0g+aekJ3YAgDpByjbr/XabjztN9WxTDv4txypiS1A298mfY/?=
 =?us-ascii?Q?UGTsrCw7/HhtY4t9RvVSqGRQxHE+gaPGERJW/AllPt4p82332wFAmk+OEaGq?=
 =?us-ascii?Q?rXmBO41zfijRDP0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E0cdt7zN+fgyJgJxxFMUnZyPG0L/Gg4ywvdOT/Ho4hOximsjxy11LI09doyA?=
 =?us-ascii?Q?mm6FFIhA7F/Cki6jS2r7CS4IzXKDAyIGpSMhj9QqFkVF6JlC8G6C7RXeY9N5?=
 =?us-ascii?Q?9H0ZsC+hUXK5p47Y2GAiqLD02eHGpNqKgjjYpb8J2l9gcBFBWkG9BExqOPPl?=
 =?us-ascii?Q?OIwMxwe6Rp17gu6pQBsnBe47R4cPIMIz/TZDofllaGkij2zc/rT6qPvm+b/g?=
 =?us-ascii?Q?DtYdT2kSQB2Es3XEi9E7DyVl8vHAQzZTH2dTUa5nmxLhsb/cblCMmBXEQffU?=
 =?us-ascii?Q?JijGpccIpYfDG3ote0KvyM3dyfpvAoUWQHkXYETG4Njdo63qAmZ6CzonIIeI?=
 =?us-ascii?Q?FwT9OaaLGprTLRWY8qsLqf3IF5THvdmHSY0KWVdsqd0C2s9zfN1II3pGhv0U?=
 =?us-ascii?Q?rcKJAitNgMJXz/ZbYkrMlkVxmonqKsrEWPqyRt30h7ImJKS1nBjkGovXWuHk?=
 =?us-ascii?Q?fBjZegMcqr9N1oNiMqJvbFrYVQVHWxTMRsq+XW3MPWRDsvnRxfQ28/I7SdEm?=
 =?us-ascii?Q?cXPdjk+QvW5MwjVRLnxt1SLwpYJ7QcB4cbFN4m2DgldIlVEmaZzwjeAMbtbQ?=
 =?us-ascii?Q?V5V/fIYEFk+KEP1FDCeGPC6/R69EEDLJYWhHu00eVyZNJWkLANR/NLCv7bKg?=
 =?us-ascii?Q?C20Mquhtcvx7kOxDzGaR0ilRXHFgZyRCU88nvLlvXpG+cw123ImOLBUki0cY?=
 =?us-ascii?Q?pN5Ou6BM+EMuT9V3xasivtCrcK2x13yWcKZ6w4t+PK+z6lrqG9N8iL3aVuo6?=
 =?us-ascii?Q?MwDl1X+CJ9U4XwWx3z5NxM6A2W56CJUutrH2ps4uQm+yO1lkE+1e3iL1lt/G?=
 =?us-ascii?Q?l5y1M6aWPje6QaDEPJR7BL6+sD1fxaDag5XLKMaT0yrdUlz5QDHF+JgWgSuQ?=
 =?us-ascii?Q?z90EXA6MtwyPBOBvn/+8f0xkCRDBvrJKpN9Kknmkc3KAM1gRE04DAHLSehWh?=
 =?us-ascii?Q?uMTF7j9ph6FWCqMbbhTC9hdBdvahL6xWmwP4Blt9e1cv+3G5jk0PrNHLRyYR?=
 =?us-ascii?Q?pA1DngUxGbngxk6Qt/zZbCAftyU40mw417Wj2UWHfyrUoZIlJnZyJe37Q3RK?=
 =?us-ascii?Q?ASNhE9iwI1uT6ND4N3OqLmEDbdOKYYDKefV+gt3P2hp0Qqjnlpp1PYdNFKUf?=
 =?us-ascii?Q?E56/uDSR6OxF8/S2R4EVNJ17yvSbCCDL4qn8vIH8GIOPwkAIhiACD2qwyAbH?=
 =?us-ascii?Q?TVIh+7Tv7yt1/CsltZkMJUOk1x7dBRXGEbSF0dGl+ZuJpQV0wVqHKGsdhaiC?=
 =?us-ascii?Q?LYN+PsIEixC9NzvkTbVQ5vXWQQBglMPT2OEexFRFBMex6/24IAAIsjQ3svEP?=
 =?us-ascii?Q?kle98f35HinToJk6qe2txMga4m9xddWR7FAsaAScXgkISMbR5m9O1OBzN+i3?=
 =?us-ascii?Q?YZQ9/QJR/QX/LiWU/xKieL2d7buX3XDeL401Uvno17XQCVpOqQtBg1zL2FPm?=
 =?us-ascii?Q?A6t6ds0tF5onwKqcOgr0/1JtDCg8bPLteUZeAEYZdKJjPjv/y2BQuq6edEf8?=
 =?us-ascii?Q?lWbV5a5snyk0PAMWOowIA+/qeoZhqGOZxzfzGw40jPo/SnCLgtw5b/wT5SCg?=
 =?us-ascii?Q?d5MRHmAOJlIwOG4j2wSF8QJe7OyxbP7j3c9k++aj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d33d6a0-6897-49e7-7259-08ddf208042a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:24:00.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlwYtQ16+CJyzj9HMcLSlL992ywD/jLxeScHxhFDgjnLW+WaBL9YqAXQTKGqYWdKD5dcJJqGTIrOAj35ZVoekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10990
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072409_318182_7A5003F6 
X-CRM114-Status: GOOD (  14.81  )
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

On Wed, Aug 27, 2025 at 01:30:07PM +0300, Jarkko Nikula wrote:
> Use the same "Ring" prefix in all prints that print out the ring number.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index 8bc9de189543..3fadacbda582 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -775,7 +775,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  			u32 ring_status;
>
>  			dev_notice_ratelimited(&hci->master.dev,
> -				"ring %d: Transfer Aborted\n", i);
> +				"Ring %d: Transfer Aborted\n", i);
>  			mipi_i3c_hci_resume(hci);
>  			ring_status = rh_reg_read(RING_STATUS);
>  			if (!(ring_status & RING_STATUS_RUNNING) &&
> @@ -795,7 +795,7 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>  		}
>  		if (status & INTR_IBI_RING_FULL)
>  			dev_err_ratelimited(&hci->master.dev,
> -				"ring %d: IBI Ring Full Condition\n", i);
> +				"Ring %d: IBI Ring Full Condition\n", i);
>
>  		handled = true;
>  	}
> --
> 2.47.2
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
