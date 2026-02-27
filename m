Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AFCFEFB6D
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dja29zmCbqWaHotpnw15PNkRtKnz0h0w0eqDEMXDloI=; b=m9A7Pl1vuvFwY6
	itpgbtWSftSTTxk+oXrtPdMU8F1Qi37GMe01HuO8dcCXvitk6zoBvaR/tt+39RpoUg2D0IoQoJxVa
	K7KT+x6a7Em2PnbagxEDjY57/qmWHZ6R2IKuyfW6RADir16cRh7RPl8+d6ZLU+oEy1OKiBvtjh0nO
	33rs3Y0vjFUAe/KX2WGp+deWVnMA+vIGeE+ijPYRP6TCEJ8YxF8VVVX9Q6HxHT8MtqzSUjO/34IcW
	V7I9Td0zMmbt6m9TA/XxkabDi3IX8lp0hqdPvYjQnMldbVSce0xN1mlcWyki8/iWdiTOSR/wlS5hq
	UgesChDvL8mtpOAWJK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0gz-00000008jUQ-0o3p;
	Fri, 27 Feb 2026 16:27:53 +0000
Received: from mail-francesouthazon11011044.outbound.protection.outlook.com ([40.107.130.44] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0gw-00000008jTu-3oJJ
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si+XY5Q3x9McJnqydXDKX6FICkFM5j0engewSVn7PSRwgvtR/JKZOEarR0jZ/p65V0xP0qf0wSnya2dCZoQ/69FTahTrxh1Wh78zb7PcFzTrt2eKXssddmrwBLLXziR06mazm0P05ZKD+ttGczV9AETo1x15Fow9haVAGMbRpH+VFY7VZWLrgp1BD2rG2a4s4ChxTGX0Qcen6FLm0Thb9C/Bh3IyAjWhOSm194LwIFingffE7t9peAw3dy+jye9VUpXilVrWiUC5pIOPHBinu+UeQW41CVKyPzhwUS8JK3ypH/uB0VWFx/w16eZLMyJ3qtGKDmmWFjWoAYfbYB+E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmO0pJ6rYuIT/FWv8/tlOj0l8eCxEQLszL07rSnz3BU=;
 b=IV1OFxkvHEH4Yb9EOBXEuVik8WpSochy/oz2InuvVPlUTyPkwRBarY6eGtPl8E08w4c0XwEqCvgkVdv2QAyXxTAOZnsFYVHpXMv8ktvYC9QaAJbhatR4PtGTecjeMcTMVSZmAxwAcdGV5Oh91YQoVXVSr8jeNSRYCD7NdXK5JLiD8aikvHqImOrslKk2+V7X9gcQ+Sg9N50uSpVEhKbFcvbO7gCrAc3XG+l0JxwNSZxE1Y8OQkAYc6iZcK6LHLDh6TJJeCpCZbT1XxT4e/I2n7SM2AM7WCq2zMdFNfJGjfGRqpfsI10wBImBegIFs6IMvY4JsfIvn1L6iPKKY65Qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmO0pJ6rYuIT/FWv8/tlOj0l8eCxEQLszL07rSnz3BU=;
 b=ccVgUjuQVpyzkELpBFtPnmdORyMwkFXHZISUVBZKmQtytzxJHoadM1BVghRzm2NmGGDLMH2AhHUJW2A/fRLVUrs2lbIr5dYu2DwdPA00G3w77dEjdzU3TtTPDFTqLqZXbq4FeMpSCL9opeLZ647RKYF6Y9suZJh9578OCAdZvfPCWw/BCd4XkqWRMmbevplTv0wuxkhIdKkzBX6z7IjbR4TgxPdZitriBA3ZYiXx0ga/8VIco8T/xTw7+bQpaN9Wc/7ABzZk4RmTOvNm74hc30NOdEkRrzKTmIi5ukUU3bVTV+7osVcklzvhD3KpPPJvGZA9CXfUO0pEFUVAcW7VWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DB9PR04MB8478.eurprd04.prod.outlook.com (2603:10a6:10:2c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 16:27:46 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:27:46 +0000
Date: Fri, 27 Feb 2026 11:27:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 07/12] i3c: mipi-i3c-hci: Add missing TID field to no-op
 command descriptor
Message-ID: <aaHF_Akd_Np2vWis@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-8-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-8-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0152.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DB9PR04MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8f97a4-ffd7-4f63-7051-08de761d23e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: V4HhC94r0jTS8tYZiIgYGhs+tH4MHUMihrwnzp6hbe6pnbUP+BRbXrgBr/xveu5t4Jlflwkc3KveDH1RWzvVELYBzW714f003JhUZysfooqSwkqP6BxBqkM8Wu2veBiZQJLAVjZ4Aw947MZ/c5cJIhDCx8qIif/8FOBldZfoBJlTSqhSTNLto49qhIcWmIa6kbYcuNox2TD4Mrmw13cyy8STw5WsKRypIsC8Drtu63c5NL9BpiacAPgiSrGpRhkjFkpxns9p4EZFV4tgtSpcw10LBg8nUXZ++CdboQ0TquSx6iuQG+f96EHrA3Gf6r9cC+y56b0KiJJGgQB/EvmHYYCEw2SjjWMChtHOEaEwiySy1ZblvChknE82sa8n+MyfA01bfPk1oHMXrf728z8302SJ46PbesvIz3C3EjQBW3UrrB9sAN+zRpMfTgOne6ijy5qvKknggGefJvvjBEe0a3mXX1W23YN0WfMe/CuaSsfeUBp02t45ew3c4ifnQN2tN++fYflsV4J8/77WYp5Nt+mvsX4yENGYseL20uMUNGLIJowrBged4MH2l0dkdDKN9ec4l+8ZVkPmeJBXauTHx3dkDetWSnC11J+m9QqOjhpQdGx97PM6bdLydqbge1pY6k0GiKWcndyaZtjpoqgJ37elKjksllU79cS06myyZdv24+9m0rdHKXl7x/0p4M7Wx81YsrrxkCu8nCn4CAbn45sW1ug0+3TAUFzpUYoEi5s4mUmlnr3ftcgrdnCXW1pIXS95t4+2PZ36X5y/1AtVslZyA2mHwBTkhCB+ZVwD+L4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?osOSJ1cxcKqe4SLIFNVJpYB7Hs4hI5nIG0rq0cjdN5KW/dE4ppm1l58XDugA?=
 =?us-ascii?Q?eaMIcRAdr0pZ9jEA2EvocAM2RmXVvEs+LV7cv9UEMaiZQUNgwzQ938V+z9rK?=
 =?us-ascii?Q?EDkq77MOSB3TQJ/JFJaptqXGzb2UWbuHudhMj9bqLM481DXQ+Xd7cOqox+nS?=
 =?us-ascii?Q?gPFzO9myYQA9doqyBkZjJU2NFboLrZZgArEbdCZUSvrU0d24XRpSs50wSHLk?=
 =?us-ascii?Q?W9G+DDh9Hl7IXGctHsHkKr0m9KKuXhJo+XFOhvEuqjm/YNYG9wHIwPcVl1/X?=
 =?us-ascii?Q?ZCQgbbhQbn2PzsVkRy3cKLD/0yqZKlifNIjwyNrsiQM3AIZWE4rivnbBfxQu?=
 =?us-ascii?Q?eUbF8RZ+2Gixth/3pJtpcuAXxAWWbRnesTIFDFtyXZeXHPsoU4lJ1JKpVhYO?=
 =?us-ascii?Q?I6ydu/Aqhwmy6iCb3l9KMQSGbTfLh7tbTXZ4CLNWMw15StsxEb8/76xIjxrM?=
 =?us-ascii?Q?ZbvivqQv0JjliQOWsivt14NtMXKAv6es6ZIx93IPqXa6PAjL4o3DNBJ0B6C3?=
 =?us-ascii?Q?anhhGgDjSpim9hbwilI3pBZD6HxD/qnaoloS3PCR22zcJszc8dH08sqZ5nPr?=
 =?us-ascii?Q?LRLmnjA55+iHNaP8IIvNVdnN4mXHKuDaOrPpWXuS61rlcFgNwVt96zzwq0jW?=
 =?us-ascii?Q?VeDF1J6Gy28j65LtegXfTzz1AjolzxpL/6Xr7N3UvT4kqzXDAGe9CcuNfIgW?=
 =?us-ascii?Q?TcffHwDM6MpYQ71ZLEBp9T5CWFteTXqUaKBOh7IgdaslGgbH7IAVxAKdYgAz?=
 =?us-ascii?Q?CJ3nF4nefFiGI1sj7gpHNO3qUsUj+rLsJsBOHmLBMT7bqIGGVloSeWcZvb8E?=
 =?us-ascii?Q?AIDK6U5jfK0gOZZIWfbp+d/AUdSlTwWVzOFCyetq/ZcpgWoj2qLpxRiv2WRt?=
 =?us-ascii?Q?iBHftL0vPcGkkLs+qQ8fUT4u/eYKnFvROuEeqhb7kf0M0Hijr5a8F5TLDnCV?=
 =?us-ascii?Q?drlOLZvgGHBVTm7zBfqhSJV/XdhS8blYXsYk0vfsNnpDjnAJdFIXZZFZDMBY?=
 =?us-ascii?Q?FqWn/MgKYFXS1bP/wLsdTVUK2IirNPsj1afsIjAjFdcHXjXd8A68ExZnr3MR?=
 =?us-ascii?Q?KYQtXVUg1LapaCbbecUEd2Xr4ZZ90dvR1mSfSJtHozkPHc01kfe/QMTaZJ04?=
 =?us-ascii?Q?950ztfybJuDoeIZecir5320PNJFpJ1GsuQQRxtk18yfKlglUxgupIOa4EZU9?=
 =?us-ascii?Q?ZpFoCsYaSJe8Xd43St9T25fYXmLDVfzlLDC53DuUCzvtBnyIqVRyOJnfKH+1?=
 =?us-ascii?Q?AH5R8GF6EztvkJcgfWO3mfUOLVuUg6jWo9vbuY+cuTngo9ZBR3bY/d6AXsan?=
 =?us-ascii?Q?GyhR8sJAV++7Khh9mX/h35nSsbXH+PKrLYH7+pdiQyw3hJ83D1c3Dq6knPf1?=
 =?us-ascii?Q?MDrF7U887lDpL0VoOdA8AjN9T4EXckwr2Rnn+qhKfv1f1R8KAS7OeePyMvQb?=
 =?us-ascii?Q?RQdaF7y6vJLFBqefMKedi245S1HU5BgIiT7K3Nr+QIwU1pFiVPj9clXdNoeS?=
 =?us-ascii?Q?4UwfpBQ6pgJYrhlgg85JnpK1ZmwFSA3sqliViF8TeDisA1+3+tM6pEV6418R?=
 =?us-ascii?Q?C1K7OcXaVH1NqmsZnDdYNAokqsL4kqh33+ZQ+ZSBKF6OCdYmGKhaHt4GnUYX?=
 =?us-ascii?Q?d6mNyqGV6OnYjTaTPj362aC+vjqxS+2KA/D90WxfrLdEobo9EyhYq39dZ/cx?=
 =?us-ascii?Q?HbTjobBYrjQ1DF/xzorCFvVEzmo3ReZ6kniu27RpYyqFmRB0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8f97a4-ffd7-4f63-7051-08de761d23e0
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:27:46.2632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/X9yQBcud2+MWwoch/YiEPDrGVDhnZYVY6cY/KaPzehYri4azNkUDjOKotddEdQfskk12v+gILzxrFF4ohtPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_082750_970862_1ABFAA0F 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Feb 27, 2026 at 04:11:44PM +0200, Adrian Hunter wrote:
> The internal control command descriptor used for no-op commands includes a
> Transaction ID (TID) field, but the no-op command constructed in
> hci_dma_dequeue_xfer() omitted it.  As a result, the hardware receives a
> no-op descriptor without the expected TID.
>
> This bug has gone unnoticed because the TID is currently not validated in
> the no-op completion path, but the descriptor format requires it to be
> present.
>
> Add the missing TID field when generating a no-op descriptor so that its
> layout matches the defined command structure.
>
> Fixes: 9ad9a52cce282 ("i3c/master: introduce the mipi-i3c-hci driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/mipi-i3c-hci/cmd.h | 1 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> index 1d6dd2c5d01a..b1bf87daa651 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> @@ -17,6 +17,7 @@
>  #define CMD_0_TOC			W0_BIT_(31)
>  #define CMD_0_ROC			W0_BIT_(30)
>  #define CMD_0_ATTR			W0_MASK(2, 0)
> +#define CMD_0_TID			W0_MASK(6, 3)
>
>  /*
>   * Response Descriptor Structure
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
> index dff96b84479e..a11d0743fb80 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
> @@ -586,7 +586,7 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>  			u32 *ring_data = rh->xfer + rh->xfer_struct_sz * idx;
>
>  			/* store no-op cmd descriptor */
> -			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7);
> +			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7) | FIELD_PREP(CMD_0_TID, xfer->cmd_tid);
>  			*ring_data++ = 0;
>  			if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
>  				*ring_data++ = 0;
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
