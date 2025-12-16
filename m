Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB151D609C2
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Dec 2025 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3yZQg31nmXTAirT/IlFFE67p4N4TaehhT1JsIlgXVU=; b=jfWTCYNSRrsF9b
	JQZ5gdCrzfptR/MgZRXnhlwArW/E71401E82amghrNIIEFx7kj4bEiMR9vX3eHWNfbW0u6Kn0e+GZ
	kfFhT+o2fcAeKL7m9JiUmBBD4itluMNojEIWukLwlIkoLaxxfERInyhh/N0F8D/Da6tkOecq4a+I9
	YocFH4JacOcaL7mq6MuhSZGPZ/1MCNM82u8N4ySuhIrCBUX7pQz07km6oxFn3zm3sFCsipge8Zu8L
	RszBfE7eea1zFtHAKwd3H7wbqqyACJt3ixKf/jnhOrI2gHQF05dpCUk3wO65LRzlYwjWjN8P3jTZs
	Wk0Rs5IS5kAqQYfM3uCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYXl-00000005acP-2tUt;
	Tue, 16 Dec 2025 17:09:01 +0000
Received: from mail-francecentralazon11013061.outbound.protection.outlook.com ([40.107.162.61] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYXi-00000005abo-1kos
	for linux-i3c@lists.infradead.org;
	Tue, 16 Dec 2025 17:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFfr6vU7mNH0Wmj2SCiw2jhoyXbtn2cdi/u7fJ2a5w64rZ1UAugOzCZnZQxs8We6vZkm0rGjEblgFQv0iK6j0QYGa16NWoO2JO0xvBliFuw1AcMMJGolUcqhiDzVctsPeBBsO1mGN0i5NNTJe0dxaRm1n0/BjCNIxpev2cWWyA8e/lLex7RO1f+yIuoCsPkGlaZ7NraGYJ4vN4EFFxX7+pKyofHhrS5wwEaeZOX47hAa5fhB5F39qLeyC5JDqgrgqRFo9fb9FBQcIC+4Nf42a4kZmJTLBDaL7mPKwHb6iKhDn+jolCYWYabLS5eCZ82UxWyEQkBt6+FSxle9IoC1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gftS+Czd7hdrv4EkRJFYPmRYZgRmy7gqmsdcNuUgA20=;
 b=rnn+PQXe/k3s8YmmKmIhinqpuvrg/Qkma4NdSLbKz3YEz5t3EYKAhh9aksAkUyxCYBs8A7kbsCsB5MAsHF+DK4b8upMXmTr8EM+1qBhVNGFVN3q1fDUymj/9Mr+mIU3QQvlUEzraMXOrmfdYrdnD3wd8pFn6X6t3rD5BtbdNKfO8h42yF04P7CiKpHW5MEsLKfKGHoo9OIyI/gAXnhGienGBFQYfokoUYjRtYe71lTjZtubaSYfqp+amekG6rz+lw7x9QKdnypQXm6UamqxWS9xDe+niKeqL3grRsefKjPsFOBIWyZHWnKUIOnMjuVIkw0wrh6gjp1m/651PJN07mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gftS+Czd7hdrv4EkRJFYPmRYZgRmy7gqmsdcNuUgA20=;
 b=g5y3RT3AhBqyuFkNCg7orgaNcFuOlDzkd/nCQ/Vf2jCJf1pX9ZKQO+/XpshMGie8zE6HIylEMyjLEh6ZFolyc1158iaFyomKAuvKbGaijcBAWR/QvWZhRadIPOgW1vO3t0J+lBZUg+/4qJVywrWKA81kbU4Z25/hLm8kYjWvc4sS8dI1gRCYJygxLNe1A+EiGDqy/yJZ06DSkhTam0CllgjqCqhx0ugD/VxufUdSt35fe7q06Ow9VhvFZNTNONvMlv7603BpuI8M0/Wuta3n8rIiFNezXm7PUx9yP1zeCsJYPMI/UBhjwkMnpfSjdpxtqhc2w71Qj82nmFZV6q7Lzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 17:08:49 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 17:08:49 +0000
Date: Tue, 16 Dec 2025 12:08:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 06/11] i3c: mipi-i3c-hci-pci: Assign unique device
 names and IDs for Intel LPSS I3C
Message-ID: <aUGSHCqJ5+4Jwdh7@lizhi-Precision-Tower-5810>
References: <20251216165642.164583-1-adrian.hunter@intel.com>
 <20251216165642.164583-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251216165642.164583-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SN6PR01CA0018.prod.exchangelabs.com (2603:10b6:805:b6::31)
 To DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b3026e-4620-41af-38b4-08de3cc5c813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mtCN3qNiiXNfIn22kY8riKNQIpG7SUKy6LyZ2DlrchrJVfxdHAaDLJEk6BlL?=
 =?us-ascii?Q?xI3ABQzqSNu90/kauX/jYVghfe8Y5BbjeXm+fwyRl+RLEhw5qL7IGKUAy8lA?=
 =?us-ascii?Q?9paoWgl5C+mHu1F5RhX5HWUT3aZXoVZiizk/pjVHRVEvYWUQM0kyJTSvlK19?=
 =?us-ascii?Q?xUt8kV0DIaPM4Ns5/YShxwdPSwO8MRO84n8ZVIvRxzBg/dGsy8fhMaSmRFMB?=
 =?us-ascii?Q?QfS2uGtUpafuferrMeMrvEmUTApIdPbWis63CA0f0txbtU49iXKyjQZCHTP3?=
 =?us-ascii?Q?RHUR0ZyardOK4Z117jFyXWsxXxdZ11TTMWI0VvDvAIkAVV//W7iK6UdkDLS5?=
 =?us-ascii?Q?DEMDliLFGdPivQgQTcWSZqpjLuYX0sr9TStuPBuPBXkxql9dalzPuYlIH0ok?=
 =?us-ascii?Q?P9NNYk7d9vbynCoWpdHFTObekaXBLGcaVA3C3htNDZsnFSUASYd7e9o3wmjW?=
 =?us-ascii?Q?/NeEmCS9MaZ+iq9cZVp2zGuz48uvfBzHSq0SmJkQEUVK9tMws7FBkoObAutp?=
 =?us-ascii?Q?FNhxEh8+BkEht+5L6/KdzMDnmHCB6QWkP3GKfWAsHU3Hc6DGW84+Yrf2W5k5?=
 =?us-ascii?Q?W1+hjHkahB/MpHaxuUbJW3eDW96SjE/KKP7YV8XVqRF08dhs3naULOwp7ao0?=
 =?us-ascii?Q?8eiRo6D0DD89CWAG/+qpry5x2fuMCEbCCKrMyLa3WFVU8RLFlv27yZs6QqZ9?=
 =?us-ascii?Q?O6ZDctrpUrzmvdfplt3SK8HJVmxXKtmHdUKs4j4X0N5vAzcdwiiCK37dgZx1?=
 =?us-ascii?Q?6WGe2qwyJoc/JTp/FCu/yUUSAt6h/rn6ts2jjwVYon0nh69Ri4KRMfpgHWFV?=
 =?us-ascii?Q?FEBdHFl6P/G69ImTgT0WDF9FdP1X20fe3kcP7iiwz/ompFAVogw+QB8PUVKT?=
 =?us-ascii?Q?eJ+VT7I7Q4eEQITeM3Y2SNW4lUK+uNhUf0SqstPhfAL4DMyoZWk56+DDE8ou?=
 =?us-ascii?Q?SCbxRdCn+x5+ZNAPeWHdqw3IKpurCAiMvHSIWcQ82DoGrdlmRhA1B2BPCq/S?=
 =?us-ascii?Q?fVzu+5ZjZ4DFNKyevBW9pAe7W58ynBXDHbxlWYYrPDZMyJtcc7uiXwPbFPAP?=
 =?us-ascii?Q?qQFs8S4y28Vwv+U4+hJ0OiifkrTAelYbk+3NEwQ6vlXl4yBgealbZjGzEYTg?=
 =?us-ascii?Q?xTqVJJ9EZ4/tB0+cHdhHf/b75v9PKvMy7mnzzGhNyiSJJLSsWdflPgKE22UZ?=
 =?us-ascii?Q?hVfk5afdXsh6HmFPwnHVo2+IHfWgubptSoqK9RR95P25JQyOaTEPHa5DXAT+?=
 =?us-ascii?Q?hlDKVmVEBov0Es7TL8LDgP82YHWryM2wei20v3UChMukPxY56Dp4V6S55dm5?=
 =?us-ascii?Q?TTAj0pzULdPjD12XZV6qpfy3cR+QhoKiocv9+mk0sgW2qMHRtMEImp92Epxg?=
 =?us-ascii?Q?GYAUnGu0tkUHzcEuQ1RuZB4VKS5jDNbwObOpKLEM1DUunCc2m/Tt45mQmu81?=
 =?us-ascii?Q?rrV36ZHqwqUjb30W2tHDtxXm4CmR+qTirZ5GyI5IE4tet5aBaR1Ass666Vzr?=
 =?us-ascii?Q?FXX0X/qCgpG5t1VtPFJ607G+du69qXyR9j+H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KA+45lxbwv+6p5ysBRugApIdeKZc2O6hxOvUjWA2HYms6/4Xcc7a2uhXeVbO?=
 =?us-ascii?Q?7z2gBUyr88Y3RnMonc/iU2LrYMvpps+WCVNgGSwBgJIouytAopj+diXbbrC2?=
 =?us-ascii?Q?PlF0t5tKjU6MOZTX9AQZidAgHufmTxA9eYxnOpsJlh0/2kvcDfFUllJLqX46?=
 =?us-ascii?Q?Qw26L/CsxySTx0SF6anRp15CJeyVIlcN47VoWNuO8eDY53jUCEfsPq8U49Sq?=
 =?us-ascii?Q?8GxH2JS59au0+zAh2uEOKquB6e4dg2fclkY9cNCuKgdPSNXH5cJeVvterdC/?=
 =?us-ascii?Q?bZFWqRzJh7wz/VwxH+tnr1Y3OY7qgn9Q2DbROWJQZr6TNk2nz0C2czTnoeRb?=
 =?us-ascii?Q?2tJWT/bAc92Ig57QxwGKYDzMbfPRk5Cf+J44WmNdHUKcnNU+oY3VUOTb7Ewt?=
 =?us-ascii?Q?38AxsDAj3FI5thFCBexcVbB0NQCW5x3YxYgiZF5QbWDUQWzfsN1e6bqXotvK?=
 =?us-ascii?Q?gRNsWV5RpR+gytkmjjS6t7wW9S9u8Nb2l2YFeqH9JHNj6O0f9pT2hWehTla6?=
 =?us-ascii?Q?rNNFPwlgt0m5xbGRUaHGCh2p5bsIE+j4xcGEO4HPj6ZX1DNCCtTt9JpHHU0u?=
 =?us-ascii?Q?KElWli9T/HOyvpiX72ZXG2W7tk0D2RMTtFKbKft2Mpp1x+0GTnWO9hCEmuko?=
 =?us-ascii?Q?m7NK8bn47oN+fa5+hnUh2r5U+AQDaB88BCxSRp/FtruRpZ+Eyv8eTpLfjG6M?=
 =?us-ascii?Q?LAkj2Ny/tqiu30JPIytiqVBOIR/87zBSsHIqXWuaTn6UUn1bZt6ntp1jQnAX?=
 =?us-ascii?Q?936dAL0cIHiKV+LQjueB+MKQXDijFu+qd/AoI95G3WtF1L98r7lfcLMa15xw?=
 =?us-ascii?Q?JRGycJzIgePeOJBSVME/zG5q4Cp1xCmlIajdOY55TUkUAcqKH8PbR3Gv/RZn?=
 =?us-ascii?Q?ODQOYMBeLbfh19YFVnoG5vhn3U/w4pu8uWXUKXtg5fh3DyxyrDBrBy+jottQ?=
 =?us-ascii?Q?3Qj6qwYo5xhIkbL9DqfjPrU/aE5HBo1FWLltuiU1J5NRWpFj9npm9xumdt3y?=
 =?us-ascii?Q?+wcIjAc5RlTf4YD/8PEFdBuLLAO2d86o4TWt30U9jFOFsK0VdtX7091ocn2R?=
 =?us-ascii?Q?GPZjpphfn2o/mE1BDYB38tIPG0Sm9bKYA7/PZMv/m1AX2vwTJXrLuyPJ7Heg?=
 =?us-ascii?Q?NcFrpXJB0zmdokZJOL62X5NhREmMBk6Cg1CEI0/xsTHZ816JfiC/ECysh/y7?=
 =?us-ascii?Q?d87ZuEcBEMxwf5W7g3syXpgjr8ZcJQA42BKB2PlMKmefQ2vKKqdlJZnRDNVg?=
 =?us-ascii?Q?ZeYOlc84qV2pQ0CocekJDhRR6RYp0p+Ap/+PrFlpysqiTQa/TrsIf4PjcxIi?=
 =?us-ascii?Q?8xsFZX+PouRQYQuLJVIL1FGd8fqS3MFynt3d5AdIOU/zJGpBE46BV9FOoPf/?=
 =?us-ascii?Q?8T3z9sePUcjq04jIT1/YFOMHHEeQzxr49K884F/yW7nZUeWq7+/gPDlEQCj3?=
 =?us-ascii?Q?6QLgRKJrpwJhhi9w8SRm67yvZOtHitPgIhIt5fFW9MBxsisFBF+z1OMY2Elo?=
 =?us-ascii?Q?MfD68ENgk79ipcbmFQ+x//ozMhz3HQpnGjiGneteu6T1xynzv/cEw9tsst4f?=
 =?us-ascii?Q?QrCFJ6yLAG3JewG8grKMomJ54JD/zKT+n7eiZ1mi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b3026e-4620-41af-38b4-08de3cc5c813
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 17:08:49.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNBpMMQwVmxIB8vRmokMhrqWvUnb59MmoZ0QXG1whv5NvthHoIw9mqh7ygyIh620p+wJ0x1KHS61lopJqTgEWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_090858_633122_A7BEE827 
X-CRM114-Status: GOOD (  30.12  )
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

On Tue, Dec 16, 2025 at 06:56:37PM +0200, Adrian Hunter wrote:
> Simplify the code and ensure names and IDs align with device documentation.
> Use explicit device names and IDs for Intel LPSS I3C controllers instead of
> dynamically allocated values.
>
> Add "intel-lpss-i3c" to the platform_device_id table in the mipi-i3c-hci
> driver and use the same name for Intel I3C controllers in the
> mipi_i3c_hci_pci driver.  Assign hard-coded IDs to reflect the hardware
> layout.
>
> Intel SoCs include two I3C PCI devices in the Low Power Subsystem (LPSS),
> each supporting up to two I3C buses. The second PCI device is assigned ID 2
> (not 1) to match this topology.  Additional IDs will be introduced when
> Multi-Bus Instance support is implemented.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
>
> Change in V3:
>
> 	New patch
>
>
>  drivers/i3c/master/mipi-i3c-hci/core.c        |  7 +++
>  .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 43 ++++++++++---------
>  2 files changed, 30 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 07fb91a12593..3d6544a64188 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -790,9 +790,16 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
> +static const struct platform_device_id i3c_hci_driver_ids[] = {
> +	{ .name = "intel-lpss-i3c" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
> +
>  static struct platform_driver i3c_hci_driver = {
>  	.probe = i3c_hci_probe,
>  	.remove = i3c_hci_remove,
> +	.id_table = i3c_hci_driver_ids,
>  	.driver = {
>  		.name = "mipi-i3c-hci",
>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 0fd3587671e1..3b319fbf18ce 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -27,10 +27,10 @@ struct mipi_i3c_hci_pci {
>  struct mipi_i3c_hci_pci_info {
>  	int (*init)(struct mipi_i3c_hci_pci *hci);
>  	void (*exit)(struct mipi_i3c_hci_pci *hci);
> +	const char *name;
> +	int id;
>  };
>
> -static DEFINE_IDA(mipi_i3c_hci_pci_ida);
> -
>  #define INTEL_PRIV_OFFSET		0x2b0
>  #define INTEL_PRIV_SIZE			0x28
>  #define INTEL_RESETS			0x04
> @@ -179,9 +179,18 @@ static void intel_i3c_exit(struct mipi_i3c_hci_pci *hci)
>  	intel_ltr_hide(&hci->pci->dev);
>  }
>
> -static const struct mipi_i3c_hci_pci_info intel_info = {
> +static const struct mipi_i3c_hci_pci_info intel_1_info = {
>  	.init = intel_i3c_init,
>  	.exit = intel_i3c_exit,
> +	.name = "intel-lpss-i3c",
> +	.id = 0,
> +};
> +
> +static const struct mipi_i3c_hci_pci_info intel_2_info = {
> +	.init = intel_i3c_init,
> +	.exit = intel_i3c_exit,
> +	.name = "intel-lpss-i3c",
> +	.id = 2,
>  };
>
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
> @@ -189,7 +198,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  {
>  	struct mipi_i3c_hci_pci *hci;
>  	struct resource res[2];
> -	int dev_id, ret;
> +	int ret;
>
>  	hci = devm_kzalloc(&pci->dev, sizeof(*hci), GFP_KERNEL);
>  	if (!hci)
> @@ -217,11 +226,9 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	res[1].start = pci_irq_vector(hci->pci, 0);
>  	res[1].end = res[1].start;
>
> -	dev_id = ida_alloc(&mipi_i3c_hci_pci_ida, GFP_KERNEL);
> -	if (dev_id < 0)
> -		return dev_id;
> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>
> -	hci->pdev = platform_device_alloc("mipi-i3c-hci", dev_id);
> +	hci->pdev = platform_device_alloc(hci->info->name, hci->info->id);
>  	if (!hci->pdev)
>  		return -ENOMEM;
>
> @@ -232,7 +239,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto err;
>
> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
>  	if (hci->info->init) {
>  		ret = hci->info->init(hci);
>  		if (ret)
> @@ -252,7 +258,6 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  		hci->info->exit(hci);
>  err:
>  	platform_device_put(hci->pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  	return ret;
>  }
>
> @@ -260,28 +265,26 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  {
>  	struct mipi_i3c_hci_pci *hci = pci_get_drvdata(pci);
>  	struct platform_device *pdev = hci->pdev;
> -	int dev_id = pdev->id;
>
>  	if (hci->info->exit)
>  		hci->info->exit(hci);
>
>  	platform_device_unregister(pdev);
> -	ida_free(&mipi_i3c_hci_pci_ida, dev_id);
>  }
>
>  static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
>  	/* Wildcat Lake-U */
> -	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
> -	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_1_info},

If there there are two 0x4d7c pcie cards in system, id will be the same.
Is it okay?

Frank

> +	{ PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_2_info},
>  	/* Panther Lake-H */
> -	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
> -	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_1_info},
> +	{ PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_2_info},
>  	/* Panther Lake-P */
> -	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
> -	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_1_info},
> +	{ PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_2_info},
>  	/* Nova Lake-S */
> -	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
> -	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_1_info},
> +	{ PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_2_info},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(pci, mipi_i3c_hci_pci_devices);
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
