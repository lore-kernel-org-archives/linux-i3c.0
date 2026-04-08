Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2604CFD5F85
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Apr 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkoBH1Ypu2ZMHz1c6TE0EpdlsPHUGSWiv2BagBOH/QM=; b=Efi/AH8E8FK/SM
	Q7N70jIWX0Hln4Sd4HFzydwWB4CbkXkgNRcOZKU9bbNuRDMVZbGYCWR1x3N/pcUSix9nC6CFdoRI4
	VINrzlGIhjwuTAOGZ8H7vC7c5qIqguC3+6wlgAE+dIeZZICEXzYOz9WwtX+KE63+/w6VBHbQfTfM2
	YeMv82NTg36XT1gq9/wpTJqxdBZfvRxYBWeLdn383Qr8nh/DKEWD07t4TxjYlECIDDTeAeoCJaPEb
	pNWd44a1Oc58rv7v+tbKSAsE9jywSLNglOm+tjshc73DCilF1IwlvPDVZEYXsREp0FXgNtHPBtYdx
	yigStqB/NsxV8jH041YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANW3-00000008S3M-2uR2;
	Wed, 08 Apr 2026 07:39:59 +0000
Received: from mail-northeuropeazon11012061.outbound.protection.outlook.com ([52.101.66.61] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wANVz-00000008S2L-0O4y
	for linux-i3c@lists.infradead.org;
	Wed, 08 Apr 2026 07:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKHb1grzKLz1dzRTc9VFckHOfCQF8yH0nmPxRhRfYfv9to8NznsBMk5l/KDzbGJizNrdA6FbTsoEki68F/u9YuWK7xf0yT17APpx+i5FRsm6UEMdX1daG4e5DRPb/tpZuo1JWlYOflw/LxVALHvpT83OgxFweUuf5scmEZ60noj/7OqsWre09t4W0UE2Ljc6XqrLXe91PgWeDCiUsR1kcUZT9RNWy+b8LqClOscLjjwLCxYbJtylljpOEVaeMVEUx/g/9A7Fj3s5csKgb45LtmS5FRu60XRHi9E4prjU4FKT2tU60uVgb9PpqIdQvWm9M3xtoXZM2S19JZNJpi0y8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uadXwt23LTo7DqqFUzTmkPFJDm+lidL01TAAVzGxxZ4=;
 b=Qe4v7YzzpEU19A1gm5ApfDNAXvz0khZkaMLtWUmYB7D8HkeRyQ0924olx575UPpxvryw9s+mrXJG/5rz+l1MquDgRg0IHWIr32N72sTj5rRjvF1XVVV+QG5XNPouePmfNzJqIsrH5EDgYK291tKUjCHE5CTkLvb+ABidmtSr/sZKbDTvY432wzqfgf9RGSuPEpMmDS9iVE1jdivxnkiUkGYMFUXr4l/7YCdmykEKQ2XMSSFSIhWTDP4lY+68k+7jsd3mBF2Gf097iKM5VvHfgPAbQ6q0vS1xGV2Fq4TRWUumdJnIyzvBq6m4JxqQJlaHOFKcNTgsnhfpP562GaA0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uadXwt23LTo7DqqFUzTmkPFJDm+lidL01TAAVzGxxZ4=;
 b=ZtOyeFxxMgD4nxXOd5OMCEOXkamxTSBYnuUJWUZkejt0Br7KUDoYqxirPsgtQm52rharHZHcDROEhwt9rgpyZhOAyzRjlRNXbuf0WW5tKV5xPaF3JMLY4bq4jLqTDsEcHxx2fhLT0WKzVXC45oSDX4FQ9aT++LYyVCRATv0vyVMnPFDHlz82IjZP7fhOWDZltvRIEtPFGsuCRHhoYTtouCcCQ0MSR/EsJyVe1hMnQU3XBQ+JDXgraolHxVmnsLkCqsYuw1qayhIvpw7guHvQlgIdjaw77yenfCkNFBh660X2LS2e8oAv2079UsR+pwOSjLgrrt5BjjsHD2FZ+57a/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 07:39:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 07:39:50 +0000
Date: Wed, 8 Apr 2026 03:39:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: mipi-i3c-hci: fix IBI payload length calculation
 for final status
Message-ID: <adYFwaSP2uODgr5J@lizhi-Precision-Tower-5810>
References: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20260407-i3c-hci-dma-v2-1-a583187b9d22@aspeedtech.com>
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff736b1-d610-4415-daf0-08de954203cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|13003099007|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Qz12TfRWqsWGQHrrKQNZWXRpwkIF2Qz8n8Yn84BJaPnWVK8Jh/AyCgfm3+M9lqX2gzdqjwRraBc2XY36+3lIQu2z7QXyNQOcVXyJEhOglqp8JUxpAsm8QAslmegaFuR09Cy2ytCnOl6cxtr9XwOFlSXpfV9ysX9pCE17trlEo3vUPJr9Xng48OGDQYW0nCg8qkGJAZS93t8Gqi5DgniE+u+gZ9AFSu7h1y/lXRtHl1knujEP4d+TotJFTwedOigEos99sWosdlK9Jz2GAqbzSSPhxNhxFEXKNik9LowSJq+SwP4/3o5t/XZFSVVfwy1YPujI0Gmo9e3uCsLat0FLMnJfBUQArr9k2xaaFjRCIviZG+Ek4TlOfG4GYmbDTTLyBlScwDtw+8KhvdqZgyp+lDUXDV3Au5S9jmtzvQOP2QuXd0ps4R/X5cvzcakntVnhkRJ2FmBaiJHh/buur1+IZMTYNXE2hLI4DT8FZHCuagRk5d3HxSf+LjNqrBfeUBwjKtPss5oMv2tTvxOWd9GV/mC08QpKplVIbmbFfSDLHzqV1g41zJ0zvgK6flj9uN+r8lWJEmTwl2qao7ZGEHwwF5tbkwPqVi0cBOIJMO/zMIw2bunZKImKCxW4f4q/v/0HKgps9wqOIxAvwMagQWOVlAH9yXPNbN71JDEkPzIPg0tt08pMJivXUfjmMrPjKPjVyc+oe9ZaFhqLUGF2dyeRDqh0AljpwGa9JVdD99cMy2wEYj9Z3d01zJNvFAUZb7P1bPfBEENOEgmPS/kUdFL+0hgB5l4C5ObmSu4ODRv51bY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(13003099007)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ibLWY1Dtizj36pmH0XR9IG/+uQH2W6NMkEnxJ0mFxhTyy8A7A6SjawPQlyZy?=
 =?us-ascii?Q?xDT7OKcbBtbwE9GiM4RxL+/xNILGtDjZKysXIR/Bf/70vNHtnl1f32zTxGt9?=
 =?us-ascii?Q?6h7/LQ2wfKtO3h8z3RcuCT4i0a8Bt4hvk/0z1vANC/M4fO8zbNJDzcRxxsML?=
 =?us-ascii?Q?joZVtkiSd6UAlXBlgT+ibOHDZLEqojrjpydf18SbFxUkZv7fvn5E2KJwmt2x?=
 =?us-ascii?Q?zc0SgsujXkerqL0ubUU2ELAiG68lAgbPvjnlZBO9CgJTfcvrsxm+HfaRj5ZQ?=
 =?us-ascii?Q?9Zb4UC6eK9dNvRIsLcEtqCCjw0dz2HZSllI0tEKreL819+dfX/tZlrdGP9iM?=
 =?us-ascii?Q?ZIGhBFHY0XOzWKc5pCwOiEmCA3Ogm9Cj/DHdvrNtz5ELA3GOwypas1DuEmge?=
 =?us-ascii?Q?7mx4dm1TbI6PFAd1WXPCj/7dNx+iTx/yEYZXWawetjyuGfXTlhwX8TT3b+eI?=
 =?us-ascii?Q?vT/wivkQe0W/vdBaCL4bBbQELZOD68R2nWnd/ogq/wjk/kVpzG4RJlbhVfHu?=
 =?us-ascii?Q?ubHIUc3mTIQuSfPzYawzL5Xh2rRmSy17p0bVhFolDiGWVlb27RGqWPivmMv1?=
 =?us-ascii?Q?yPPSca3dVFvhIFXv46POg6S4/uy517b3uyW+05HCgLiDo0qyl9DjgvTaK40g?=
 =?us-ascii?Q?eblxjC3X0GKnAwJlq7cvXP/Jm8eh48fnQREytKRAKw3onwQstysvtMLs0FgV?=
 =?us-ascii?Q?tJVZ8rjQlGravm/66XiRoN48TUBi0/3F545g+zF7mvxJkB1TZUcOCHTibPTH?=
 =?us-ascii?Q?WqT9SV2h5nUw15eaMhQIYnt2JChKp8j4oH6Krr1+SBZMVVI+sBH0gOyWCURO?=
 =?us-ascii?Q?VvDPpSSf6fbYIIw96i5D19VH1epZA0d5nrHhgHmeV8ljB9fIA+mNOb/uNh9o?=
 =?us-ascii?Q?6DyC/yQvwQ4vQ++JjdGcbR2dzI0w6hi0Dou1+HIhB7cS//AEeHCDtgCDzReC?=
 =?us-ascii?Q?ShufwAAO5Wjz6olklZmUcja+gMYRuXa9o5AWSnnepNaQugx87qHXYX1di/mq?=
 =?us-ascii?Q?hszOfQxgx+jjMZe5x5RsqhjOtN7qol+7YCeRoNHt7vDw8G/rl8tN/5J8279h?=
 =?us-ascii?Q?NIVi/uXyM/8IRJduottA2fPtEQK6IQFqZX2AWgniKhdPtBIIaLVOLPy8qefl?=
 =?us-ascii?Q?aMb6l9uDF5CDLpJjkDpfZb8ptydRnDU9xlshgN90W/Md58ontJEYslAzc6AT?=
 =?us-ascii?Q?PBA+Y0PoCgiTjUY9p1SxNQh0n7O551PiTtzeenlzUVrWACUmcgyI+0SaZ771?=
 =?us-ascii?Q?0Cr9dxdbIRyZGf2dZp0ZcWsRWGduLjy89zrWiq+FMK5SjEXNdCdrGG38x2K8?=
 =?us-ascii?Q?i5yNaiYnGjaJHqOLQ+nX0cRIoA1fLnfJsunxnWT+7r/bQfpdsyknXkIEu0pY?=
 =?us-ascii?Q?Xlgva9paf2fEjmRtYTwjJbZTqozuG0Zuf3rQO7UF1lxXOdX7PvKUb7FRr7jx?=
 =?us-ascii?Q?DfegvSUfiqaBbxT+Ibh9xuDnjhN7gpO9ILr3C9zoY/akdkXps8o/Yno1xCxm?=
 =?us-ascii?Q?Vh5CZfvnm/Ru8eC8bQtHP7jBG7wthOIn2OPbYUarDvMMvOR7HbICfygdw+1K?=
 =?us-ascii?Q?B+MxRUZXQQugfhxUi7vI45agC66aMIRABPPPfyVHZhitaUfxavJ/KDjV4+jj?=
 =?us-ascii?Q?mBocp1Gj01amms9A3+LV0Bu2wZrF1eIrDnXooYNSpcAfLc8Kztk7ir9ToXNz?=
 =?us-ascii?Q?0aeI5bSNzEjRpYKsjH3V1Ddjry9fNcrlkElSjCAGb4/JrmwI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff736b1-d610-4415-daf0-08de954203cd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 07:39:50.0278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BZj85YOeER2F4+wnnqe5nXbV+mV/K03yvcTmV2/cHc85Y2krJEwS61sIngDjNJKXcyehTnNMXBDVbmRU7s16Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_003955_134509_5F61A570 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Apr 07, 2026 at 04:53:23PM +0800, Billy Tsai wrote:
> In DMA mode, the IBI status descriptor encodes the payload using
> CHUNKS (number of chunks) and DATA_LENGTH (valid bytes in the last
> chunk). All preceding chunks are implicitly full-sized.
>
> The current code accumulates full chunk sizes for non-final status
> descriptors, but for the final status descriptor it only adds
> DATA_LENGTH. This ignores the contribution of the preceding full
> chunks described by the same final status entry.
>
> As a result, the computed IBI payload length is truncated whenever
> the final status spans multiple chunks. For example, with a chunk
> size of 4 bytes, CHUNKS=2 and DATA_LENGTH=1 should result in a total
> payload size of 5 bytes, but the current code reports only 1 byte.
>
> Fix the calculation by adding the size of (CHUNKS - 1) full chunks
> plus DATA_LENGTH for the last chunk.
>
> Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> ---
> Changes in v2:
> - Fix IBI processing logic to properly handle IBIs without data payload.
> - Link to v1: https://lore.kernel.org/r/20260331-i3c-hci-dma-v1-1-e5cd295c44ff@aspeedtech.com
> ---
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index b903a2da1fd1..c7272155c486 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -721,7 +721,10 @@ static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data *rh)
>  		if (!(ibi_status & IBI_LAST_STATUS)) {
>  			ibi_size += chunks * rh->ibi_chunk_sz;
>  		} else {
> -			ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);
> +			if (chunks) {
> +				ibi_size += (chunks - 1) * rh->ibi_chunk_sz;
> +				ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);

this should be added to ibi_size reguardless chucks.

if (chunks)
	ibi_size += (chunks - 1) * rh->ibi_chunk_sz;

ibi_size += FIELD_GET(IBI_DATA_LENGTH, ibi_status);


Frank
> +			}
>  			last_ptr = ptr;
>  			break;
>  		}
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260331-i3c-hci-dma-3aae908b4e8e
>
> Best regards,
> --
> Billy Tsai <billy_tsai@aspeedtech.com>
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
