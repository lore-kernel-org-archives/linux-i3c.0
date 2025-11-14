Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA27CE8D76
	for <linux-i3c@archiver.kernel.org>; Fri, 14 Nov 2025 19:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9ssvsp6bqwi/XbTMhXzdHwjmOfv2fYFRwIl6593xCM=; b=PuWNQpVYgyhtWs
	om5MCZsi4nE0ejZ8QGRvmrC401mNMz+yLi31HwBsxbRXwBa8lq8oxUePNgozu7mF+X7HYkI9OQBK7
	J1QapdqFGKXYllOYdsnUyv27mAl78R2qHZ7vm15O1eTqX80wlaaPi5bMGSqH3UnzQTaeyGWAoPild
	xEdk/BVnhJ8Vj7eSTNHhtE4iLq+Uo/C+rdnwPRp8NbPdlHt25fnh23WBWK26/WUalGDdL9D+0dW6f
	j3NyHT7qtAlFgVZtVFdM1Zu47l6B3rPLpTlBzXWnPqIwTPsg12uzacwXBisTyokz6cPakECOorrT5
	3RHX4SAXnJyVNvL7Q6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzqs-0000000D2fP-0iXT;
	Fri, 14 Nov 2025 19:52:58 +0000
Received: from mail-northeuropeazon11011070.outbound.protection.outlook.com ([52.101.65.70] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzqp-0000000D2ez-1NCu
	for linux-i3c@lists.infradead.org;
	Fri, 14 Nov 2025 19:52:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoyAQwoLipPFAsi87l4sODGzkki+YfTePvhEb3ccT3gytDSfjeS85+L91C18ZspMkf90ez7YkS+UEAndPgzzWoFr3FXvyuP8KQ2kY7PWIcdyXSDt9gwwegzLhS9NT6MwU1cgHVp9iBYUcI1vFaDJJC2s46/F53AwEiE6ORjylleYho6HZH9r0XVMzm29nIAduqzZyyWb8bqszBFJ2Ubo+XmAPA3wtzCuetDkOI+aX9UP6TZ7gBAt2qHHMwsTxANcHnhYoI9QuBGQ5g2o18mV0xQ45jF6+6/ABu/k/cbjt55mNhPB2qq4pPrhlihFlfQtsR2tzf6NhxK3hMA8H/onaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yqk7QuBUvjvozAqJW8F4guK8XgHR8aIPXRTnVe48Jw=;
 b=jqfj6VrO/IFwEmNyCUOwiKlnx8xdyvcU6tTfsO0LWdvQgf3h3w0MAAY3OZ2Q9rfh4tECkaN3dK3nxezX4eyXJtjX8q3qM5GEZtN77KZFWJVIdWfnpR+zkmA97F0xkXB1PLdZeIVaCI+AoZAlDkXyRpjkLB74s4DCsyIeoF26UPzaxa28z4yH38mTeZYEzRz8otXkykXrG1tX8OCr8K9LK/X6aKAv764jfyUdNtyZ/wXT7KTlk0IWoTxfcwQds+n+9q5tf/w3HPjfV3y3ReOvKOFnAw/M2ahxzhD7y/zSUpeOs/NSwxlldX6GcpNCVI4l8faOP9m0ul5pXeiADVE+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yqk7QuBUvjvozAqJW8F4guK8XgHR8aIPXRTnVe48Jw=;
 b=nBQjXaQTaPJmVo35c98GKCfRVeEmPAamvqGK/ESdhcTM4NqnIbrZEzC/qYM6ItenT17HMhZQ+MaA8+K4XZAORnxsIaLoWGytO/rOIcdOvWMff7bvEsnBrK+Ht63Z4pqg0YxFIZ55KgEkAV0R44UJoptLb4LeDbOUpWVTYOegpytBdUp1VSlSwVTLPtEWxXN+o1h1xAeFHYS6ofElKb4C1CT6eR28lqGJ72w8YF/z0va3b8Ya7yEgan9GX8V+rvUyox7rDyuaUr3ajWOJXNfc2t9vtn29TIEOeCmC3XDDIxlKtHop2KwM4J45ai93kCt90wddcPcibitVGCs9/jAguw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 19:52:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:52:51 +0000
Date: Fri, 14 Nov 2025 14:52:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 10/13] i3c: mipi-i3c-hci-pci: Add exit callback
Message-ID: <aReIjGV3FfOd/Q3W@lizhi-Precision-Tower-5810>
References: <20251114181356.66515-1-adrian.hunter@intel.com>
 <20251114181356.66515-11-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251114181356.66515-11-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:180::35) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 56206a4d-2ef8-4854-6d09-08de23b764a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8gnf+yg+FvOoZYHQrS2I/oVqz7bKIZFd1U5iOpUGozndhrDEFpvjZsHqj7GZ?=
 =?us-ascii?Q?af4mSJYot6Wmmpu3XyG66I3Bh5XeCcZ9kspFvvd3WHMPHk2lrFsK5CW7IybG?=
 =?us-ascii?Q?ftSVfe8NcXeAY3kQjX7AlMx1wi/bg10pbC/NaPPOEwEZTlXwXZm/tXh0IyC6?=
 =?us-ascii?Q?A5e/ylYjSLJX5k7ZQLID+0liFMtkS/MjnIaznKiypzkEUfj0x4K69PRb8/iT?=
 =?us-ascii?Q?PDzgqahFbnSvUxXQdXzjKlyleJ/bbk04YXYjI3TedHI7DlLgos49gFvyE4dK?=
 =?us-ascii?Q?WYqK7kDFnaBtYrGtDqm42iXtimabJqv3bo2hWeq9hv4Wc+/NlWHuT6aaUFw5?=
 =?us-ascii?Q?jC0fbOrKCMWK4bTTKBaG5MK9FqpLZBuIgH6bliIhWa8KSHckYtvrn1vZkToR?=
 =?us-ascii?Q?7V+w4KafXJF8049MjYnDpOPTkrYNSsOoPTWEG8sGbXhxgWlr3vHLiTdv3A7g?=
 =?us-ascii?Q?9RKSnz6MLFlqOWqoiGIQNSUSboWG/rvAnUxkqLUmeT8R5hwVqU4aEgCl7XES?=
 =?us-ascii?Q?R3erCYidzTtFKT2QWm1LtvLd/2BhilhMhxrN8GV3k1vINnhv1dpZ9qSf5wfA?=
 =?us-ascii?Q?kaxAo9XXa1EfUEVeQ9BjJYv98AmtBPhsNLLs0BqPWz0trj26q6HY5xFIXc8t?=
 =?us-ascii?Q?Zu7MztNj4HwUrDEQ0ThZaV6HbYnhEjLa1CktQadUFLbHQQWL9m3fn52GRruc?=
 =?us-ascii?Q?sofjg6iegPnvXr85AKu9wUAtS0l3t5cke44ISMz6H+zXCwtYJiTJzFl/1xZa?=
 =?us-ascii?Q?nUvm8WiVqtwaEygsUqLtZeQM2eISuwJhRCxbozm1p5YooT9+64FR5wfkU541?=
 =?us-ascii?Q?TErl5EMYCrnx6syzBsSZA/7GUGZOvmYdowRMNANjwtPMRCuthRjeokzobEsp?=
 =?us-ascii?Q?p+7JtS8tDvchQ3mGumU5U4Yop1mFHu/z9fUpnXARy6lKEhff3YOytYGPtvR6?=
 =?us-ascii?Q?VFzDopAt9YCiF8n3me+CEOIfo69HrxT0M7cNcXM++JxhuWP3bQxRjfaRDuRd?=
 =?us-ascii?Q?MEd2Z8ZWlxpHJtchhKyDY84Osy5L+8qRLd1Pd1qjQyzhFwCFI+q7h9NrqYjX?=
 =?us-ascii?Q?RovPYoDdKCr9TCVr/39vx4og42DL3rPovbFzSuAUiCyuSceGif+gz71olLzX?=
 =?us-ascii?Q?9e5D0UcwyHSM1mb0/ZLBiYoZWEPeEKRVqNXUe/7JiK8S5183JgZg8MT7cRuj?=
 =?us-ascii?Q?g9AODgnNX3CqjwFee6TA1Ut6eYUPVbKL/0QmiVy6KdN5EWFE3yN+SrigJpwm?=
 =?us-ascii?Q?ZyXgrbcqDGqql55FS6W/q3RsGe5JSTT97bvL90ppIbX3EKFyotwpNKd2sqgK?=
 =?us-ascii?Q?AqeeW7HWfylsg5XgmgFc6jKBvap/wA2b0vRQsWvgnN9advlzc6CkQPXfJ+Gh?=
 =?us-ascii?Q?VPVqrXBB46OBmzVQ6BSdW6RHEbET6dbFVORJ5NUfM5I2R407zbWcSP9Btk77?=
 =?us-ascii?Q?WyN2XIuAX7ZLCAAnT5G1e/026BjufI9xGLezTMGOfI/pEaTHm4wg/5Arz/yC?=
 =?us-ascii?Q?FxuySYy9+m0XrqqF1PEu5J6OqHmACO8D27Lx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+ttQu3Yw6Qa9r7PsjwqzFWr87LoMrymtMjXVJIyPRfIqVLhxDPsyUXsoDb1?=
 =?us-ascii?Q?eKE35lYFDElQVywxPbixgS6isb9ly371u6IJSiO20X2HC3IIS/6GLiFHKjar?=
 =?us-ascii?Q?sqUr+uDI64gQwNhiaOCsnVfy2QuEq6/PGYwXVgVXT9hdLUzw+T2FKgNWlEls?=
 =?us-ascii?Q?kbHod8f8l+rRZ+h8MadpSi+siTLORmwQWFrHnbyyeDhv8SKIkMSSOZAZWNiZ?=
 =?us-ascii?Q?ntL/USPgz7gSKWFCIsjlcE500HB/HwojraGO2NHp1pqlvWj/LuJXok40yL6V?=
 =?us-ascii?Q?wnCO3jnbIJCZU/tKUpsA7W3y6DwBfr6kBJ0AhD2k3eOQVlKv5C1+itOogtDl?=
 =?us-ascii?Q?IMfgKy4vu/POprIruOUiT0LhzE/5Ai0X3vnqKyTIG4msa9oPL2zuVAsRKfDG?=
 =?us-ascii?Q?C+1zRXkoiDwCHMLWidmaxgoRqLmo3lvkLCsSSKNY7K6skXmxZ2r+KLHb8nkD?=
 =?us-ascii?Q?oOhdG1Cl4ES5LMkHwZk947i8cNnkz7SPqsx2haahETawPorrFVT0MPrQlNW2?=
 =?us-ascii?Q?6jN8e4pphj8zzPGcZM0amo2AifrGEgleIxI4/4x2eu3OnWfmiNs/w33IVL9M?=
 =?us-ascii?Q?YiwtaNLIV9UYM2IgQU50aQnzX+CNQOUUmbUirA7uzRRONOBOiIqi/Z6liyM5?=
 =?us-ascii?Q?b0MLTrttf2ffKVMm5iUFQqtdMwSezvKs1Sk5CnBLhJdQAL+wDr69DJNez0NW?=
 =?us-ascii?Q?YrWx/zGoO2SD92JaC/XZrgyyRMmS1IL8AV2nGcHGWNbxunqb+t7d4t2J5X1z?=
 =?us-ascii?Q?ogV/GE++MqFw+/rLaDTFNSFNd+Bp3nwMF5/8ieYfY1Z11xk1YLo/0HjSuaBZ?=
 =?us-ascii?Q?pvIfRHnMe5i2xa0rcCz8a+awSvRfOyYiIbZR0FlT1RVwjf2vTWNK5n5Gt9aI?=
 =?us-ascii?Q?VtSiAVdh7uBy19yOb4AwanF+MR49HqEtQyscIa5N6nQa3mflN3fhUkaNGLZR?=
 =?us-ascii?Q?WIcOSzJiY+OZjhnRbg0vRvN8V0KLko4Sh6O6T6YSwHr1nI2Uv0IUeIuvOeLr?=
 =?us-ascii?Q?aF64hJ2ONyIM73wgxqfaxVdkNndrbTuSD8XRv6bBDR9u6ledQDnWPpG1E/M0?=
 =?us-ascii?Q?KSITSLSmX1+Z2mSy+7RtYO6HjbOo3Aot8/oZrQRX56G4Jq/imdiVGxnH9VNJ?=
 =?us-ascii?Q?NsZQ6pBiTzngQ8jB97M2WwyvVAqSKWiVcYzU7eAmFv09hqIIO4cMuULNMwqK?=
 =?us-ascii?Q?llmMEO4rYWknoZlwTFq2rVvVDiIUI89++VHEUCEAKu/QsGI5jdrf2xVzyBKg?=
 =?us-ascii?Q?i0XuJhNtDZrhZb0LoPN4a6AZoDYfvV0WxCOUbgycQpWrpSBQz5FuQ82Q4mUU?=
 =?us-ascii?Q?24LhJM36aqy8juwmsVrkpF1KAK0tcrMTgRAZrL4HlPI1/FI7Y5kx87rySxO2?=
 =?us-ascii?Q?3PPegrrDLYmpoqt+IBi2EzNTKCk5nB+egK4Nm6HXe1bbS7HIbn7vLJYl8KO4?=
 =?us-ascii?Q?tsPAb98kObtgPu4KNf5cTrCkcUo3EG8e8EbVLnBY95kd6MwOdfpPCNNI9Atv?=
 =?us-ascii?Q?niZtVyBpv0GWSM1/0/bnPZpTqvDk4Y+LnQ+Oz2hOrs2W1YcWUh+D0MaoBo1j?=
 =?us-ascii?Q?LWWoS8vSF31it4I1dpVtfgOwsbbPvsKbtI0gV9kM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56206a4d-2ef8-4854-6d09-08de23b764a1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:52:51.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuiPtKkR1keVVHEX5hNWZsQfP/jURt/S2vAW+sqQovIcopsqooRmA20DoSxv6mg0An06xqlNinubqyyDrkFiZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_115255_387166_F549E238 
X-CRM114-Status: GOOD (  21.68  )
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

On Fri, Nov 14, 2025 at 08:13:53PM +0200, Adrian Hunter wrote:
> Add ->exit() callback as a counterpart to ->init().  This is in
> preparation for adding device-specific features that require cleanup
> upon driver removal.

Prepare to add device-specific features ...

>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>
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

This part's change does not belong to this patch.

Frank

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
