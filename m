Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5817E98FA9
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Apr 2026 03:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHWpebLcYe+W544hBckAX09guwkoTK1JC7eOhq3O2tU=; b=eEwXfazxrBENLl
	5eJVKzlnQ0N9SdGFj8sgcx41fFHfQKqii0t03RUEZ3BijqWpfGl+hcMme7VWZKk1WoaEF6UU4YeHv
	Gd/sYKCY2tt2KD7CU/SvbwvTw+RwcZlNgJNOeO+OkdFmb3a1weTx8mnNXHs5tZbAd2jpT1yUUVQh9
	JBtWFb/ltTAFqCSE0zap4/cDJEI19yEYSdTquqjm1XiMue777hclzHJIvk8YDnD5Fg0439qLYJNL3
	pqZpjEGfTK2tZLZZnyvkaQCDuYhLWxw9KxOEH6RlugAUuCawBTvpz+DnN9gytXrtjWHmGXOKp6YLB
	1BIKNj3QGWx4Z2OJ/OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgWw-00000009fxl-34ps;
	Thu, 09 Apr 2026 03:58:10 +0000
Received: from mail-westeuropeazon11011023.outbound.protection.outlook.com ([52.101.70.23] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAgWt-00000009fxQ-3Kmo
	for linux-i3c@lists.infradead.org;
	Thu, 09 Apr 2026 03:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4YynARYly47+ejFmGxifcN361HA6lGtFeXE6e1pyMTKdtt/F6hwb7LExgCYEcox+rTE9xvHAhftPR/2w4d5zjOPeHHqfYHivNptOlmMJ5QRsi06P7EU3V322M+OwqeeBBAWphHfirgC0XXRs85BSDXLE35/PJftoHIv3/6xgZU+vg7uyknRx5rwSxYDknpReZtkXjotBLrqP36eSrtuyx5sSZLGca/2fB5x/n0BJC9RP4NmMHF2HpFE9LFVbeaOih8wB9+BmQR2B6Gp/J6g0fU00yZOrTSHlzI8DhG7srGBjrD+KmV9kkZJUkPcVVppYalAG8USq066tSPRgBPh0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqBUeZA0NjXMTo9CuX+Jt1Z3pUK3HyBvJKtAda6rMdo=;
 b=Ld5Rr+FdJqvVTWRzAHBaU9DmBEeZJn0tRzAz1SI+7rv2YAscnIzVwTAJlfqBvAALjPMcrqEZpft4TRF2IalfqwDMCOotOCljrZa3yooOK7Dz10X1QrIa5cQMkTAz/oPIvqBSCq7ro9AkA/rZ6HZ9bjsYAumJkNR5M+p6iq+FhnT6XeV/fZgBxX7gdz/pdNJyM5nwlV+h+0fGnK4tYXcLgegiknN007xm5oOe0cO5P2y8PNACKD4w9fn96Q58FPua+4ngp2GLOXZcC2INsKztrcuLHRduSmxl/ED5zj4SEqDt4Zj1CFnfhrSk0FWtfdRxtny1GJOh9SuXIf46ro/vKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqBUeZA0NjXMTo9CuX+Jt1Z3pUK3HyBvJKtAda6rMdo=;
 b=NRVaFIPiirg7+HcL4DQbHVcC4HBS+grf6SsvIeKMaFUgGEhMcZmU+AyTlbJpZkxxKW3xwep8mJjFp3G4Dhp53MdO4D4oII7edy+W+NZQQ2WtdBPViAhatPGJMoNbwypDZFn39BcqireNqGapeyRV3IQW7owp9VmULqTczuxtzzwHTuVRd6gRW5y43Cj0fg1TzsiWOa+KLRkqq4eAwGoWfp6txD1IwRD/zIVzS4JqqE56jXsHeBtBBqNJyW40NJlyu26/8c6kObm/ESxgaO8RyJxBMBvrwT+kdAQQyfrDPCYMSckX3rCcaA6cvwGS+JJNljAMteajcJlBm65iyeDx3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 03:58:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 03:58:03 +0000
Date: Wed, 8 Apr 2026 23:57:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Message-ID: <adcjxZrPAGx0Czv1@lizhi-Precision-Tower-5810>
References: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
 <adYFwaSP2uODgr5J@lizhi-Precision-Tower-5810>
 <OSQPR06MB7252E35BC0A9F2ABFFB80B6E8B582@OSQPR06MB7252.apcprd06.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252E35BC0A9F2ABFFB80B6E8B582@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-ClientProxiedBy: SA1PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: 01897644-30ba-42c1-bf3c-08de95ec3308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|1800799024|376014|366016|13003099007|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 1682hiFmy93GVmB7DXsQmFwu6/PR2R53Oxu/a/QuMrmfLljAcwZzlJRwJ9rvLos6BckDBwNQmwXHKpHdXKBqJtRST9OdIOCgL40ynAb3fu2fCf1khtDf2gomIxUNO1c7tuy6PwtnCGgyiYKQd0LMKuNgdwAPbE78JMkOgSxXjXxveBsdqyYrzPxEAJmfbz6OTJDhYSKzXHWr70v6y1W223dGtcykkH5w+fvyf5P0Pfj3fjwdc0+Ln/kNzvTPbAr/LmOHJeDwpq5/Mu1h20UKhOYapSb3zteBH1DoZetNl7FLOpvkF1cvOQP0wDzdNhNRncpsj8o0Qkkcc88l0AoImSwi+ALj2STt0jUSMvOjgOy3kSTRuPnwCEus8by3a+t2uVVcFhcOpWw8KobsX3jG/Td4UTq9rqaWVlwgAP1dlOP76WBgvtA7TBAi7zxOsah7mZW+smFPqXowGyUotvLC2vzERgzRrJzplJUwR+Lw8LGX0tOLNirjHOCcuUI1f74aEoSLqil844B3OYGDtQpyWTNXkAmvDf802a0jR6kVcTlKSUEAy7njwtxC0d4tp7pjiGQUGEVui96uBpAOSO9T7hbydzNqmJl9iqoGv3HBHVlaJcfCXRnwVSXbhU1hMt5cvNG1Ux3vfZ7CklmiMtyI/OYnOxjIeZJTF6uBKl7kSc9r8/ihewiD/AEe6XexHB5Bf5fbZutZFiAU0Mpf8cIuWlII33PesEUXMQjg2zu0TYebLFdtM+e/CTh2llDi6SZ6PP579TlGjdeOLr1w0dcE9FlKjfEEFUQr57I1moxFYm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(1800799024)(376014)(366016)(13003099007)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V83H9ToaiuyRO0Gf5z/byWH5u8LmwHLpuH+Ptznn2qTdaGh0q+d7nrYdEh5J?=
 =?us-ascii?Q?Qp6yMwLzwJdsQuD7A9tRECUmAX8E+hXObWAD4gWlG1IpGO8Dzbgbi9W8RcfE?=
 =?us-ascii?Q?BILt7H8wpXPABm34kGgXem0zWEIjqkYljhQYmnUc9+JNTc/P5Mxred6cqgFG?=
 =?us-ascii?Q?f9mHgk0u8HJZV9KnrZxCvUhvRWLDBIDSUaR4SZyGKwprgl9WWtbdH9RyRON+?=
 =?us-ascii?Q?qTmde7EpFyJW+fMysVnUuujrC3PIoiGmMPx8Sr8HcCQx9QomJoHDOu86aK4b?=
 =?us-ascii?Q?gMirBjrRkgfzMyPo8udD7kMumWEaxl7pkqUZZy/vTnX+0/obGy1grHavMIMg?=
 =?us-ascii?Q?vck+RHk334cDe/AqpxT02lg7RjxoBokiW53VgNiN2gmmrAgRP51/6j+ao6ak?=
 =?us-ascii?Q?e8a8tT7VHBz+YXnAcfh/K7Vs5fj3zSwksctDT/QrimNZgVAGBob2fspoWAwy?=
 =?us-ascii?Q?Yctz1+c+TIACNCU9C1vtIcU0rtPKrb3KM7ye4IU292+k19ZVDkomNPY0QhX5?=
 =?us-ascii?Q?yUTJl8RDeGQhLKeiXi69BTbRYujwX5/wMyvkQ+JIIJQt51EAtXghx5sv/3z6?=
 =?us-ascii?Q?fdttfriqlf/bEmTxJ+9ZH8vDIj5U2oF54vIb4Y+ZIL1pxNitGE+C4xIiuoYV?=
 =?us-ascii?Q?8R10rjMpomFT6d+toXbD5JzDCMG08URCi92d99f5BRpcKmEV8mNg6HmcGvH2?=
 =?us-ascii?Q?57ZknXHGTQtet/G+3+L6G/cKA3fkI03GLc6ypd8tujqoSYTBT/bGA5WVk79g?=
 =?us-ascii?Q?gaE9CImN23YdSiX6r9mMDKfPrxmDu2R4ZT/Zf2EUyM/pFHeFAU8PuRWgURpv?=
 =?us-ascii?Q?DBQ4VnDh6UbLK05AVrECvXwRSdhIX0lKvwddx0gSj1z+Y/nu6o3GUrt5YFBh?=
 =?us-ascii?Q?2ewxS8ttXtzwIy3Ge2sQsmODS7TOo57g1CZtB4VpG1aN2Vju3IypMc4Lmaxn?=
 =?us-ascii?Q?GcyQPNTL0qovgJHqVuYr3tE65E6LKiq0F7yes3++eRgBMmLhVMlS6RA5Ijdq?=
 =?us-ascii?Q?hMOWCQbLvIvAMzRbGAozI+WcyCKZAZni0lupMkwYN27LZOUc7Ze/RZoBJDJz?=
 =?us-ascii?Q?XMIat134aI9xpcbfibZRugE8obb8VtWl8lCpH4r1wCstz7GARVSKVo5Vw9qd?=
 =?us-ascii?Q?jor7yX9kCkCLJqKnUCB5FUwOMQcYSS/XSb3NplKJwmSyArSU8/D3iPtb6d+A?=
 =?us-ascii?Q?nFtIS6uxTpTVWByk28UZxMaCM+ybG8D7U+dINffJXKLa0KSpIGihBotTF6EL?=
 =?us-ascii?Q?GvRkUPt07mimp3wlN8DXADzRojxLBVD2ueFwVVgapoZDTAvT301CFKgRNnzr?=
 =?us-ascii?Q?PJxiIEFPiEOpKtMiYFG5kpFbfAu/DB2Osn2zePaAptMJy36I8aR41LSqjIrJ?=
 =?us-ascii?Q?/4ps/r1tKih3EZkMo5jIInU6zuY9jp9vxxyV6dfLfrGph/pr2gjhYsyqwRE3?=
 =?us-ascii?Q?1YUiFiSD2KChLEV/p2+l3kBy1feZaKonq3KgS0osncEMXy1qemnOqKkoMiM4?=
 =?us-ascii?Q?CKtUZQXlQLaUnmTSGZJ5ykKUXHUKx3jbEXl/uEVyNRzYXUqQV7hcVkijstPu?=
 =?us-ascii?Q?lfLsfkBBueyamU8Vm8Y90Z1BActoNfD7oEThFpUxZxMQo9fVMUkAVQ+FeG6B?=
 =?us-ascii?Q?GQIFdLrs/iYUOq6vTm9OAHls8TNIl1REwl978mgDU3PcijbCJEbyUy12L/tz?=
 =?us-ascii?Q?tXRk58w6R2NO2MU/ODCGF/gLydvKtTzPmWVk2l7A1KM1a1hXPMCWhu8GYQDH?=
 =?us-ascii?Q?56znTOB2TA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01897644-30ba-42c1-bf3c-08de95ec3308
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 03:58:03.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mX3W251nMZ3Bz+/P1WjPPQOHS2HBZax5zQqiE9JlnB2ATuRIJH2hOUdagp1Yco+aWASjzY2cYWrbtnCl0COVyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_205807_840953_97A40E52 
X-CRM114-Status: GOOD (  29.46  )
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

On Thu, Apr 09, 2026 at 01:31:16AM +0000, Billy Tsai wrote:
>
> > > In DMA mode, the IBI status descriptor encodes the payload using
> > > CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> > > chunk). All preceding chunks are implicitly full-sized.
> > >
> > > The current code accumulates full chunk sizes for non-final status
> > > descriptors, but for the final status descriptor it only adds
> > > DATA_LENGTH. This ignores the contribution of the preceding full
> > > chunks described by the same final status entry.
> > >
> > > As a result, the computed IBI payload length is truncated whenever
> > > the final status spans multiple chunks. For example, with a chunk
> > > size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
> > > payload size of 5 bytes, but the current code reports only 1 byte.
> > >
> > > Fix the calculation by adding the size of (CHUNKS - 1) full chunks
> > > plus DATA_LENGTH for the last chunk.
> > >
> > > Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > > ---
> > > Changes in v2:
> > > - EDITME: describe what is new in this series revision.
> > > - EDITME: use bulletpoints and terse descriptions.
> > > - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> > > ---
> > > Changes in v2:
> > > - Fix IBI processing logic to properly handle IBIs without data payload.
> > > - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> > > ---
> > >  drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > index b903a2da1fd1..c7272155c486 100644
> > > --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> > > @@ -721,7 +721,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
> > >               if (!(ibi_status & IBI_LAST_STATUS)) {
> > >                       ibi_size += chunks * rh->ibi_chunk_sz;
> > >               } else {
> > > -                     ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
> > > +                     if (chunks) {
> > > +                             ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> > > +                             ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>
> > this should be added to ibi_size reguardless chucks.
> >
> > if (chunks)
> >         ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> >
> > ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
>
> According to the HCI spec, CHUNKS represents the number of valid data
> chunks in the IBI Data Ring, while DATA_LENGTH (in DMA mode) represents
> the number of valid bytes in the last data chunk.
>
> This implies that DATA_LENGTH is only meaningful when at least one
> chunk exists. If CHUNKS == 0, there is no "last data chunk", and thus
> DATA_LENGTH is expected to be 0.
>
> So a combination of CHUNKS == 0 with a non-zero DATA_LENGTH would be
> an invalid descriptor encoding.

If it is true, your code should be fine.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
