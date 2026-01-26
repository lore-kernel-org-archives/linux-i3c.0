Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA90D1950F
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmNv9P3jK7kUnDQwbN7yhROFeXaHd4F1Yk41lnUa6jE=; b=JElTTgeuZ0pT4O
	LjfOdI0sjxMFnpQCBBFjPbWD/Acnc46S8DAGQCtiUCd+APWir4ihGvgrPU+CCh3p9BXN/ZdQW0b7h
	N6k0gOtq6KdZgPPS8I9kQjGgkdeO3xjJOoEd0aAE5nZuGL6nlPk0Lm9VPSyNB7r/C+gxlob/E9ilE
	u18jF9r6JhXbAVIgYO6LMc3eIY17u67PuC2/Uzkr7C9OtAY+VMncWkU3cP+Aqk7Qbr3moe5L+B9re
	dT0zYlCXlTFAF8dElAruUCjMlhX0k1THy4Ah31QzX3J6HkDf73v3J9fxl/RzonX4thbjve+bwuxw9
	YFubDkykFKqsL2QlySQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQl4-0000000D176-4BCN;
	Mon, 26 Jan 2026 17:52:15 +0000
Received: from mail-northeuropeazon11010009.outbound.protection.outlook.com ([52.101.84.9] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQl2-0000000D16P-2gSI
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 17:52:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT4JVbAexkquW3recUZpumKUVXhPU/uGyakVnUrT6yD6A3EF99VJ4cRP/CkT5rVbvQhJDrwWBrlHBRDVs7Ef1BABq8EGxoJr0WnmmRAuPur0XWalYlR5CrhMmQKxDhCfGkt+B+GXR5SvFLSON5l1F3mEAud0m+Cb5cJh/h0AbT0tC8jQdPl+QzHTJIk9TfI4rTzGBssbezqQiJJDNhZHQSxUD97Ln6ElexuyW6k0MwqyEr9tbVd1HjyBfQboUnwZbniVuyBHRnoL+KQMOAahrxFrdffhjDXGsjMjWQalMMQwSCUEXXJdTYmLZ3l5uvdDGSpul2WBCeqaN356d4AMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR0bgFos1izAKy/1e0UVm0UhaCuSrrjdUN+/POgNtM0=;
 b=GMmmS95vBAuWJcvYXyGlVKzC7qvqQnKUTM/zbOJYQBO2Np5MjHiabZXn9RYEQwj/F7uyBoognZgtlAXzBYaniCmimtik3EHI36UwZF2u/SD2/LDWtTIfu4eEHX/0y/hP4rfx1uDGYnAyGjhbh+QYJ3D/i3CiY10bgjNr6DKMuescAUIufJe+Ng53a9t9sQWgJzaTtc8DhSIH3yP3CavgWIjxBA4+Bx0jMFKzrfaI4DPbpzKW9TwbCYBBCr5FHBC0gRzTBvEKtGdpIBkMuv45qwwIvzSGDVu7rkbkMKB2khxh2q5m+zzehce8n89MOET9Pt0KQhd/VjM0XRBNwtdZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR0bgFos1izAKy/1e0UVm0UhaCuSrrjdUN+/POgNtM0=;
 b=HSKk+O1yqxEdU981Xt/SFeeWdeg+bI/GcIiob/REKLmQJEBcTf96gt74iVEMMrSs2n78YavYCX8+x+gsXJp+VVMC5lF911qupujS2QeCYMu3bhYpZrLuRDBEzn0ah3+dbwedxXjs5us+ZDIWkBCtNHDPA4TnYyj7Q8WOiUSBmbv2JRFInfENzOmEvi7dQct7IiJLprSJbsSiZxY2ZAypCviWUODH87cGrrS8N/FMoO0GFUybE+d5cm5aYYpn416IGaRoHMYTl5SKtE1nmTzFFwplUSzM16VMbYe0lnUzOO9PN/g0v258xaaKkWlTsyELDPf4LHjcANoO8B/EVbhF2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10394.eurprd04.prod.outlook.com (2603:10a6:150:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:52:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 17:52:07 +0000
Date: Mon, 26 Jan 2026 12:51:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] i3c: dw-i3c-master: convert spinlock usage to
 scoped guards
Message-ID: <aXepv3TBejr7d4RV@lizhi-Precision-Tower-5810>
References: <cover.1769404925.git.adrianhoyin.ng@altera.com>
 <d66cba213fccdf447d9410f5b80ca37aeeada429.1769404925.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <d66cba213fccdf447d9410f5b80ca37aeeada429.1769404925.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10394:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b73a122-26f7-489d-7d5e-08de5d039f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?55TAeGeps29+EHIJYE/uBiZb+VHamGzDG9vH4R/ahz77WGIXbDU97kmIkDe2?=
 =?us-ascii?Q?NCveVFnafkfocOc6CNuvbqyn3m+DRvbnYYhz1RoRRCeLnJ71cZwP8cUFPFfG?=
 =?us-ascii?Q?klqlSPwnqRtfUsJ8zViqj3KHFzOFqt0l/hc1LOqBNrv3VH/50anTBW88mK1k?=
 =?us-ascii?Q?SxDDwYV0BOn9jiMadRgJ7xap5NSDS+tgfHwox49CZFSFvqGxBFVZRKsWCGgH?=
 =?us-ascii?Q?IBBhwvgMQvGM6dWU+3Yx0cnRVeikPBB5rCT2NcLRIUJQEkqGymPjRyN94uFq?=
 =?us-ascii?Q?FEke3JQTuFhvK2BZGfHPD/muShDib3ASPFrxJ110x7wxdrfxLHW4zhqsT83m?=
 =?us-ascii?Q?kFf2xlVnsgCtSRiGn8wiVDiT/hgzP7+WCj+YICcqFtr2N7zlYS9r0y1siIKE?=
 =?us-ascii?Q?0dTBw+llrKJEbkJ48cmabDcHYMdl3CGUNQOeveD+Zh9dGUEu5wHrBunO1hwj?=
 =?us-ascii?Q?Xr5p7u7/J5CU8gqEvmmgjDguMP5i8w5iutNOr6sqKvKkOP8lJWFYJibpOsq/?=
 =?us-ascii?Q?I4bhOhQUByZnX1/Jiqgvv6kCp6MI0kf46Nl71CIaRQMGu+CbVogbsQNwu6qk?=
 =?us-ascii?Q?JPH/KfH4zzghygIfkuqt21rQ5KgPMBJqYcshrZzqnqpbjiQq8VaLRFlVsDo4?=
 =?us-ascii?Q?MSuYCNlaPfJwVOrkYutxUFnIoEiANGImAr8zYDrSI20TfFO3CJAgLWfGc934?=
 =?us-ascii?Q?NNSiMhgl+6JsAgNNkQJBe72KPe0lSBreZ859d5/YrT3Bvv37X7OYz5XTI+zo?=
 =?us-ascii?Q?W7NNHqxFbBA4aSd2dTHEyOp2i9aAMj9gjt9HVlqgGRneYaNAG852vn7j4v8y?=
 =?us-ascii?Q?GSM4mue48DvWnY7nP4kboUbhaHqe+lNIORT0gI9OEDbSWShQMSQhY1eB7184?=
 =?us-ascii?Q?X9XK0gHH7mRgSrNH9CX4dtpkLwQ9fdKdcI32saDk4fFkqqCWHYjPlwHgkCdH?=
 =?us-ascii?Q?8lCOFFNWAxfnOUMDAtQV+lhZzpromc7aniu1usSwF9j+yxV4qJAL+SUclwoM?=
 =?us-ascii?Q?EK28SHF5xDS3gssH4RQGGQDSCa4Inmghaieykcnj5C6Xg/W+MIt1tie/9bJ1?=
 =?us-ascii?Q?ywCECCkWfsRHzyfRztXgaiORBSWzrPHTfyiFnyEWHuNWvjcu/3jItGmd7agX?=
 =?us-ascii?Q?Jq85yTn4T+N5gF9PTTDqzRptYFULm0TEzY36YHPS0pzByqUlSVOGd9FGDKUs?=
 =?us-ascii?Q?ru3Kx2cfF82VMs0Mps/jk2NqNjJcw5jWbm1BwCWLy64hKRR76R3JnafP5jvq?=
 =?us-ascii?Q?jqUdyPZh2E8EtR/AuavuLiTbsguv63GvxW4eHOUzjdCjhx8DI6djn4YygwJW?=
 =?us-ascii?Q?eM/RohPNBZLJB1zoym3hx82YflM9/kpsU9Cgj/jW5H/RTe6kMU858OO27g0y?=
 =?us-ascii?Q?V6ghR9G8QRvP1vsQJgLugFJgKUkFddZdlWI1Oaswu1hUE8NWk1GoBBGQP2N0?=
 =?us-ascii?Q?Vm5c1Bi+t6yuNZZeGJmc86uUJ4fky0tXW9ZsUQHQpllyTckRJYYMvRjt6NvT?=
 =?us-ascii?Q?STOUAD/cdATDh1TctYcEHUmLxngeqzbZ+QJhcMYxU9UEyXM6e+ocAtjS0F/B?=
 =?us-ascii?Q?bj8wX8Z098RVxVtC6vK3tw/EJ2GPWhAZrwMhtLvS0EuBlwc+ArnC1v39T4o1?=
 =?us-ascii?Q?pHhErkF7t/xGeRrUDSMlEzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qOo5PCZjkbZvJwAzQOjB44dudVJaNUr3WQWnTU8J1bzyMjNeeDz8ynRzH7+W?=
 =?us-ascii?Q?pIP1ZZ8i9LIhX15rQsrXasl7H6eE6ITXrKIFU4k1tkDnz8wD9Q9ZwIOhBR9O?=
 =?us-ascii?Q?zhUzeDGjcq1ijFUwRtwgX0LZhuEDUDVA3LPq0KG/VtVWE1FZTEsCuehU1IXR?=
 =?us-ascii?Q?4n72cbBviNwSHKrd+W9H6du8I6q59SL2S91YTx3NfZnyTcLbNzlTx2Cdx7ct?=
 =?us-ascii?Q?ZPtxusSIKOn+kANHd8bo8UChZqq5sLwsVieEVcqqCDgqmu8YEkbBIqpnnavw?=
 =?us-ascii?Q?0vaUFRkLiP9X3SqJbOuctuBZRZYyG9iXymhOqM4swdrq6J6kDqxh9ohfnTsx?=
 =?us-ascii?Q?epl9bHHUm6eCRKASS+/5J48UfuhCLiFSB/IA/S84eA/hupdm4mfnZqq4vU13?=
 =?us-ascii?Q?jHjHz4Mkz6dlzUFe8DInUL0Mnt5sx79wUnV52kD8BqbgeFnCH7LZBI0VYhGy?=
 =?us-ascii?Q?cO/2beSdaYgFWC6DxD0J6McRinmeZn2v5WCOeRjPH6PMlvBaaVhuHBGlogrH?=
 =?us-ascii?Q?6jdFlAGDVR0/zWIn9LeHROiSbF42nONbspGbllX6zdk/6R++Mi3VPpCboSFl?=
 =?us-ascii?Q?x+TB5KeCUvqDGBTtMReQ5cqcbrHsKUdkS8Q6f9RfoxkgvufaitoO41ejvQ9+?=
 =?us-ascii?Q?n8U7lT78qBOKwtw8HA0qwaVI0u9FkvEOZA39DmElbBOVJxmPzpGikDh795sZ?=
 =?us-ascii?Q?jJ1WBgOOHkaYkJ1rDTIh1ScsV5ERuS2+q6Jk35LasACZEx8HQXSDMnJ6Idd1?=
 =?us-ascii?Q?D1gAJxoF35QX0zZVDEnS9lZxAzfWKIdM60YMNXTCzhG7qTlsRITf48OF6V8T?=
 =?us-ascii?Q?gSyJCAi9geg4XNYqp0J8EiHYSog0mV0ADumLrRo+oO3TtOO4jqOY9BoI2xXu?=
 =?us-ascii?Q?CjOXAoNV1ZrAcAT9yTU6e4uI6FUTFoPQ50xMvAmRYfFOz9V4GWUCg5kQ1RbB?=
 =?us-ascii?Q?izD6OAK7e/Td6HL7Nn3i3oeq/Ao/EyThMZdB//f3nThe9V5ufXVZZsM+VtvD?=
 =?us-ascii?Q?Bmcpo90Y+SsMWPc6uRB5fpSgEPZrbbV6xCxStOM9RbSY8Nr164NyTHTMvzPE?=
 =?us-ascii?Q?RSmZy6T+OntfsfQcF7KWGy8qIpUWksZu4rs4FH6aSfzeFj23lPkXCgLGVSN9?=
 =?us-ascii?Q?QAtPAsgjrS6SibeqGRY9fq2FPV3TbmoKEGk+5d8/FmGr6PBvgnUqBd70YlB2?=
 =?us-ascii?Q?1d3RqzXjLRkeODHwic4xO/zs5ribHqNVM0M6Hz9MKZy8Fm3bDRm30fOGaJx6?=
 =?us-ascii?Q?huyxWoa6UeQ5y3MsdBzPyUYdZM4Vgi8tojJlHGmStTajeVfMUI5vl1JAA58N?=
 =?us-ascii?Q?jJwHx5tG4ypXUU2GdegCxZBOymZArbOqKozQyYyWv2NkTlHC+szNAgFe4M23?=
 =?us-ascii?Q?fw8d78fs4UJeFxcHaFteNY0lID6mWQvpRW1CNjly1K4qXQZHK1nycoNHQXGG?=
 =?us-ascii?Q?1M19rQgedE0oAzLTVvO2xPljiWkrllml3jMDlwHOtZdD3sYh2ltbEuqixB3U?=
 =?us-ascii?Q?tuUUR20xgIK5/oFfdAvpHBUN/sIZ4qRRBpKaWTDV7aHHphhORm4KbJyfPvx3?=
 =?us-ascii?Q?dXkcryF53M1Mt8DX39fbXSIodtsvme3BLT/D7LPp3xxNarVuPLovzvoD4DmQ?=
 =?us-ascii?Q?A/zHHRtyqIdSsJuc02VXytzE7a1r5zuWxHf3bsvw1PZLrDxD7KHqUxrNSual?=
 =?us-ascii?Q?cuH716pM4iHlXXoSAo11+hXN/ebAHoPTeZNexT/IworJ6CK/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b73a122-26f7-489d-7d5e-08de5d039f21
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:52:07.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJgDs/PnEfRXpDXnGJmUSuL85oFvVeTLFiQoEKzfDYm8KrhPIZockYpK+KjKth0rFfEIKj3NJ1Q4sWb7cD1GDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10394
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095212_927951_EBD286A8 
X-CRM114-Status: GOOD (  20.07  )
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

On Mon, Jan 26, 2026 at 01:42:22PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Convert dw-i3c-master to use scoped spinlock guards in place of
> open-coded spin_lock_irqsave()/spin_unlock_irqrestore() pairs to ensure
> locks are always safely released on scope exit.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master/dw-i3c-master.c | 34 +++++++-----------------------
>  1 file changed, 8 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 48af00659e19..ef8a38620e0e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -416,17 +416,14 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
>  static void dw_i3c_master_enqueue_xfer(struct dw_i3c_master *master,
>  				       struct dw_i3c_xfer *xfer)
>  {
> -	unsigned long flags;
> -
>  	init_completion(&xfer->comp);
> -	spin_lock_irqsave(&master->xferqueue.lock, flags);
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
>  	if (master->xferqueue.cur) {
>  		list_add_tail(&xfer->node, &master->xferqueue.list);
>  	} else {
>  		master->xferqueue.cur = xfer;
>  		dw_i3c_master_start_xfer_locked(master);
>  	}
> -	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
>  }
>
>  static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
> @@ -451,11 +448,8 @@ static void dw_i3c_master_dequeue_xfer_locked(struct dw_i3c_master *master,
>  static void dw_i3c_master_dequeue_xfer(struct dw_i3c_master *master,
>  				       struct dw_i3c_xfer *xfer)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&master->xferqueue.lock, flags);
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
>  	dw_i3c_master_dequeue_xfer_locked(master, xfer);
> -	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
>  }
>
>  static void dw_i3c_master_end_xfer_locked(struct dw_i3c_master *master, u32 isr)
> @@ -1194,15 +1188,13 @@ static int dw_i3c_master_request_ibi(struct i3c_dev_desc *dev,
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	unsigned long flags;
>
>  	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
>  	if (IS_ERR(data->ibi_pool))
>  		return PTR_ERR(data->ibi_pool);
>
> -	spin_lock_irqsave(&master->devs_lock, flags);
> +	guard(spinlock_irqsave)(&master->devs_lock);
>  	master->devs[data->index].ibi_dev = dev;
> -	spin_unlock_irqrestore(&master->devs_lock, flags);
>
>  	return 0;
>  }
> @@ -1212,11 +1204,10 @@ static void dw_i3c_master_free_ibi(struct i3c_dev_desc *dev)
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	unsigned long flags;
>
> -	spin_lock_irqsave(&master->devs_lock, flags);
> -	master->devs[data->index].ibi_dev = NULL;
> -	spin_unlock_irqrestore(&master->devs_lock, flags);
> +	scoped_guard(spinlock_irqsave, &master->devs_lock) {
> +		master->devs[data->index].ibi_dev = NULL;
> +	}
>
>  	i3c_generic_ibi_free_pool(data->ibi_pool);
>  	data->ibi_pool = NULL;
> @@ -1243,13 +1234,12 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  					  struct i3c_dev_desc *dev,
>  					  u8 idx, bool enable)
>  {
> -	unsigned long flags;
>  	u32 dat_entry, reg;
>  	bool global;
>
>  	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
>
> -	spin_lock_irqsave(&master->devs_lock, flags);
> +	guard(spinlock_irqsave)(&master->devs_lock);
>  	reg = readl(master->regs + dat_entry);
>  	if (enable) {
>  		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
> @@ -1274,9 +1264,6 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>
>  	if (global)
>  		dw_i3c_master_enable_sir_signal(master, enable);
> -
> -
> -	spin_unlock_irqrestore(&master->devs_lock, flags);
>  }
>
>  static int dw_i3c_master_enable_hotjoin(struct i3c_master_controller *m)
> @@ -1377,7 +1364,6 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  	struct dw_i3c_i2c_dev_data *data;
>  	struct i3c_ibi_slot *slot;
>  	struct i3c_dev_desc *dev;
> -	unsigned long flags;
>  	u8 addr, len;
>  	int idx;
>
> @@ -1395,7 +1381,7 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  	 * a new platform op to validate it.
>  	 */
>
> -	spin_lock_irqsave(&master->devs_lock, flags);
> +	guard(spinlock_irqsave)(&master->devs_lock);
>  	idx = dw_i3c_master_get_addr_pos(master, addr);
>  	if (idx < 0) {
>  		dev_dbg_ratelimited(&master->base.dev,
> @@ -1431,14 +1417,10 @@ static void dw_i3c_master_handle_ibi_sir(struct dw_i3c_master *master,
>  	}
>  	i3c_master_queue_ibi(dev, slot);
>
> -	spin_unlock_irqrestore(&master->devs_lock, flags);
> -
>  	return;
>
>  err_drain:
>  	dw_i3c_master_drain_ibi_queue(master, len);
> -
> -	spin_unlock_irqrestore(&master->devs_lock, flags);
>  }
>
>  /* "ibis": referring to In-Band Interrupts, and not
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
