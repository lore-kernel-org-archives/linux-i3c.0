Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CCAD7879C
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFZxeIWGXXBmOR38I9w9PBRHAbjlkPhi4P+VTVF/f0M=; b=Dubf4frdcmuwPb
	z56fDqz/iEj0TR2640UYvOL58m4KH71iA9rqkFe/YcRgwmbt3457gtU/IkHKTuwsw6VhOjLzQ1Pzi
	NQk4EPtjGylXlmduR6cHqu1OCFmwkvaQ0nsF8sNzHiYS1CBLCVz5yqW4UXHJtVzX8P01mmIUFX3Yc
	FQYpNsMaplgjsvjRPuhulZGxxkRkRKFmBVxwC3zmaXfo4JlKfieE5wh+FhIDJV79AGIyN1madep/L
	pLQ4wMrdFmSXRABcWo6QPOFRMICFBbok/pn/HQagnoxNJFMTiJPeqQwaTwU1b4T208SzlR5uBLYHX
	WMVf+wutgZDm1T2L5ctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdTw-0000000AewO-2067;
	Fri, 19 Dec 2025 16:37:32 +0000
Received: from mail-westeuropeazon11011005.outbound.protection.outlook.com ([52.101.70.5] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdTt-0000000Aevu-1nik
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 16:37:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGukU4ZseZsERIBO2OgbIXHqDd76wtsSKRFMUl1f+rPqLm2l2vPNMehTVan/hwRu9DCk4CF5Q6KP7JKFSyvRETDTGzh+OFGQsoXN9kSJzJt4Eb40uVfrKUGWOtHJ7jWZCm22UQ/jqXtkHtJZ+tmkGMdztAM2MQZly9qL6ihJBKmkLwao0HeTuqRyEdOnSrzIY1OIQEFlGnICYYyNVkA2hkFxmD6gXie5NbD+h8kXCkqoCkJt02rIGwLtprisJOG9fwxoHJd6BBafvIsRbo46Nuwc/AIXOPWOcTGzbVpSy0sPYVhfmvryYdmRapbBJ+kIEbSmmMJ0rTI6xVEcPenJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bf7AySUEEo32E/ekmuNMdLJn2UmISvT+Z6veG4tmOM=;
 b=nTMyx5snafZCZ+qk/m6f0HeWuxiQa2Dn3oMuKk2u7wak9MLifhwjgyIkoXs/VsjbgzfjKF7JOkkQkLOvWQlJPI1QmU9lzUaeXyUoI1mzD7h/IzTM7ttAh6GBsxgolGqQjcEwUa2P6tZXGiGoTHGFqxHU/wjT5xiXUw4ciVKHTiHHTc58QecRowZtCmAMedjnAzx8n8mxz6s7ykkJTCH55WzPKgeB49mhG+1OhGXDdH38u8TPuwCcUaSgid0hjBShJ90BxZ6qG/3Jp5DVWiaCpuGUwnP+5LhYDZCMb+4lIImKmMEoyxvw89GCOPArMcCzN2dzb5Kux2wIsxwDeU6MoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bf7AySUEEo32E/ekmuNMdLJn2UmISvT+Z6veG4tmOM=;
 b=JnM9aTF8HxyCkkEO7ZrlCQ63giDkqRYCuhSUVtrzPHxTjuL5ifmti7ZON+bIyIf8Xz6IskLZaPVe1hxr38+fQHVPdSJ70ntCe6d4e+i2Yp73ZrOhHMPq0xDNECEK7SyDHFpHDAdwmObR1VV5F+dSLxdXJLyVW0NpNlpOVHxqtvGUYS6GMzh5sDJP4jc9q//hfaEkbQdRYqvJASUACeRV09reZ0gjjrEWxwoVu7dW7K9/BsBkb7L3edPIIhdNescbMuPPifYdTJNp19EihtRerM7zE4p3SVT+3A4rNkiNpWietNxKTfDRmrhOU1MYUyKpznRmNHIfBJZhEp/jH5sGaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8376.eurprd04.prod.outlook.com (2603:10a6:102:1bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 16:37:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:37:26 +0000
Date: Fri, 19 Dec 2025 11:37:20 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 09/17] i3c: mipi-i3c-hci: Introduce helper to restore DAT
Message-ID: <aUV/QM7iZjyqbc+d@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-10-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-10-adrian.hunter@intel.com>
X-ClientProxiedBy: PH8PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 5afaa467-dfc1-450b-c00a-08de3f1ce4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|366016|19092799006|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iVDQH9Na7++tASQdANkI43ooGT2DkTQVuFGAiWgWQcSJCW/3lmsIzbk9f10f?=
 =?us-ascii?Q?qB0dndFIMR+3w9gnueEB6YTijF4XW1YUyiIbPjRyE0c3dgieIsZDL8UX+18r?=
 =?us-ascii?Q?W2zzFpRB0LT3ll5iqfGRFVWPuXxB7jfbOK1/MiWp1ZqxOs9JogPaLxh1pQTY?=
 =?us-ascii?Q?HRhc9m5ZXr0tiIxjWymPxItzWEA6+K/ysJgd+YG2hw9EZ/PniC4yopOv0xIv?=
 =?us-ascii?Q?H7cu2CNl7/5T9ndik4ISBujP3q9JCIVX4tGuyhF7ZScllNi4B0OdhERbG9JB?=
 =?us-ascii?Q?f9KI3cFPBoI0+IXwDYD76HSslT+YzX7DT0PyEWXKBkfU7k3q63CTB/cqROwQ?=
 =?us-ascii?Q?CG+qU75cJZj0juamB4p/n40stf6fCs3PgfTw2eTiaHma5sk+naS7pSUbiS8S?=
 =?us-ascii?Q?56QHtoO5fFadTCQrf76w0DMCdOgZj+gXjbWR89KIKvNELm6IjglPXhDdAA61?=
 =?us-ascii?Q?48bwEWRuDEOTFr6/XyfsKmxyUJ5pDc0hj57CHibzTLX++YKjC2+r+JV4Wjg3?=
 =?us-ascii?Q?5KxEY+HIrSbBP7luPWmv1GUWvJHY51NriDs4xkbAcA5F/TC6Zb0zpJci90CH?=
 =?us-ascii?Q?rsQIijUFxkUmpdAkLQ93gsIvtxypnbGduI9wZ3eKLVlHh4B/DuUm6Qv1fIgB?=
 =?us-ascii?Q?JWKJVCbRfxG5voqFsYywU2NCOLIwC9awSwIQe7FXBkaVlQkz+pEByeP8FNht?=
 =?us-ascii?Q?RIlM5cq7qI3cH9YeuD2kfKZiSwLv0Ey4wHhmYNjqwI7wBNtdXp+QEBLJlTY3?=
 =?us-ascii?Q?SBLe7YEc6le9S5g8nSq432bu4LYovDUA4/yjfGHKpmnwPo3Pui0ILbZQc6ST?=
 =?us-ascii?Q?/Gnbsr9SLfGAzeEErbPyKoZCVjGrpWs0pAJjcIHck3vY52UhRDn+wRTVjnDN?=
 =?us-ascii?Q?3PTwvs54ifAHt7I59KzUQmfs4s5ZqAaYsUGVoOGcejOese2dbo6SK9HriBrr?=
 =?us-ascii?Q?dBrqQE/xkcSEsY8zFS14wejx4XzPNsppEruB9DftgNkC7i7cD0uihi/rxB1E?=
 =?us-ascii?Q?9Pd+EklVs6qf2FKuveTCa6fRotImqXk6tQRzNfPaC0SWZWx5Pbmdv9onyyH6?=
 =?us-ascii?Q?SZPvFlJkpXahHwJYSyywhvpUgPXdCRyrV2edBF6F5wWJDzlSxARHyXl1x4KK?=
 =?us-ascii?Q?VTYsZNWaH97Zv0LIY8czWdwnI4wyqM9y2NgLkE9u6++yclLaSyeszFTp2N35?=
 =?us-ascii?Q?KderyIrDIysLJvhB9fWf/0//luQWQ/Jit+kPa1qUt2a//iyvtjw6SyUKnJdW?=
 =?us-ascii?Q?Z+zKj/o7L6Wx3kVpvsaH24eNDSFN1gt5d34bKc9GmQSJ2sAmm1xQ9xpcsEcY?=
 =?us-ascii?Q?Jp4hcnMWeUWZdEMrqqpQtNeo8rvKWT7EeE8CPNsinYs25hlxJ5qW92bXlWFb?=
 =?us-ascii?Q?qlzinqhidkk6yTl9lidqf/2M9VNNw0vxWjirS1G0BHYKQo7/u4MzQSeb7q8O?=
 =?us-ascii?Q?foH3cOEJevudiNyimW7aYOuXhfEbR0sKkEvSXjY9VFyJkP6ClLu8ZNi94N2X?=
 =?us-ascii?Q?R71oOKPrOj6iYB71ipwppazOK8wIPCsOqN8Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(19092799006)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+l0Dp8JFUX5nWBultIIN08lKqHMFOhXnUGYKTLf+PA2jLsJaDhfJmEyiRMo?=
 =?us-ascii?Q?xVXtvfZP95NdDec1RqSvdQY3c+/ts8Hjvy6wsM6S3i4mzgHbAFgRkbSRRQe0?=
 =?us-ascii?Q?nJQaX++lYM2mw4ZqsY7F8YHL0kXtQGDJLK/pqirtHlskHSFbnhh397dxc9VA?=
 =?us-ascii?Q?KeIPzYaXz6jdOgl54a0Ev/xE9x+bhS+J/dUn8J4WAfktZO6OboGx6JLJ0ZeY?=
 =?us-ascii?Q?Zy2nsLpZPxNYmHQAgvsUZbBksAaDnIM2Ea9RGsnvTybPAB1k3b9gOkwcuZRm?=
 =?us-ascii?Q?SQ/J5iQVBM+lhswGHt17qmV0ZjMvMhhmuoYKjSbvcxbyPeGEK3Oz52hr8sv0?=
 =?us-ascii?Q?DSkrRX3F4ghG9QO/OQCcnrRpLTGLCyCrLUxXiY+E6hQ4jFYdap9IhHWQImlJ?=
 =?us-ascii?Q?zN2JnyiNbiBn1ZXyfqr5dAKyPk/ScCJmv0TAfhj031/dr//Qe5yHeTvV7Pxa?=
 =?us-ascii?Q?aIZC/JaYOYFnqxngG8YRnkaZaU5ZyBA9pm9GCYX3L9ZK5AY6dI7JI+RzzJOj?=
 =?us-ascii?Q?bNxbku12Afdd0UEIvqUCFOyBTKIeUcp5HnLeHqDEc488FvNQycNPBaMy9yhc?=
 =?us-ascii?Q?Qig/kRfkuw+KLGaHyC2l9QTHVnfOaFp9xVVR/zBWTYkIHBILVMMkYb/cZ9w8?=
 =?us-ascii?Q?Fp50nLtqUe1KvPf3EZCC0UzwWBuZ8CHowIj7y1qZ2yAxvQV2rCwfSgUUT49t?=
 =?us-ascii?Q?SxQtKUMqALBS1liOeW0otRKKbvpbKnvZgI0toOZHUHkL1Wd3V8ivHrj3GuPV?=
 =?us-ascii?Q?PsPH5z6c9kkrzhWt+yk+umixdUVyPQkyCVJCyqji4znSBEbh8j4ALDD9F2U6?=
 =?us-ascii?Q?Fx1xvw1C4y7vuzTLHe0oiEN2Y2CvKG/pBUvFD14B9AuPe69OE2ofIS5Q9XhX?=
 =?us-ascii?Q?gjJfMmw9SnYXj2gxgLy30tRDX6IDDhgNJp/3KTAmtz3re/w23zxqZ4PDvGaB?=
 =?us-ascii?Q?61xp/bJ6JW8U5EhYVU48zdH/yxF70L8qqaAlBGg3K4xGo9k3ORPi7a3RUkYm?=
 =?us-ascii?Q?4FprOzBW7OYOS+3p18Le+lJfCOVWVJq7XM2A12quXE89bLy/NYHAwej5V2gZ?=
 =?us-ascii?Q?JZHf8hdBs/ZOv2eWirXV65wRUCiAiPzky8b94IOVkmwH61zjX4pGUPydQQ/Z?=
 =?us-ascii?Q?LkjpOBr90yu/j/bVbwnZ+UEUpmAf7h06KLveMgXzaJomODaiWAGg187j9KXC?=
 =?us-ascii?Q?93X56w5syRLYb2yu8XPAyHSiU156UCz/LrmXVAkB8wgJt2c/omk2ROfGlako?=
 =?us-ascii?Q?LQVBD/1Llt5XK2mTXm1lwH05qXhPdTck2Y8GqrNjPuf6yuWXNBwr1iotefNS?=
 =?us-ascii?Q?irD4wZTZmdCd5nDWxLdDp8+2d0TKjbeBF5jFCRbOkMerlRWrfWKUyQqumD+T?=
 =?us-ascii?Q?HM7dKkonUZ0/y6LgobhUiJmzmhLQEgQkEXzhGkJV/z738TNzvcX0aDiT50iy?=
 =?us-ascii?Q?2R3cSQl+6BdFLLtiPFkNvc5fnxN0pida+nBPip/2RPFRYzXZ5LXdBXLKrcr5?=
 =?us-ascii?Q?6F5DTZHRSvwqclauGguZw0MtR+TnBk3wi8aS1MkG3VX6vm2L8wmUtUlJl7Ih?=
 =?us-ascii?Q?EGHgfRo9haUoHYll1fyUF7nGAElJa/jR/RtKxDAIvKasRaHJM+p0OTjureHr?=
 =?us-ascii?Q?3TVs1/syVoucIVAIQxf7+qWJPpSQBVFk8GtcnpcApCtrCLotnMtdM2Vh0NfF?=
 =?us-ascii?Q?CX2cGik+heaJbh2KchzHfCRASRneGJCgfQXbWwMnU/C1vbxb4qOgdNhYunQb?=
 =?us-ascii?Q?+UVXlyVLHA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afaa467-dfc1-450b-c00a-08de3f1ce4d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:37:26.5243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+T1K1sxLumy7CsH6GwdHjGN2cKdSHQ9tq9IG3vEUUT0SVO+3F019/Tec5J0SERxb9NZtsaYtr+3hH/CtxPlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083729_476134_8F008DD1 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, Dec 19, 2025 at 04:45:26PM +0200, Adrian Hunter wrote:
> Add a dedicated function to restore the Device Address Table (DAT) in
> preparation for Runtime PM support.  This will allow reprogramming the DAT
> after the controller resumes from a low-power state.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/mipi-i3c-hci/dat.h    | 1 +
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
> index 5277c65fc601..6881f19da77f 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
> @@ -24,6 +24,7 @@ struct hci_dat_ops {
>  	void (*set_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
>  	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
>  	int (*get_index)(struct i3c_hci *hci, u8 address);
> +	void (*restore)(struct i3c_hci *hci);
>  };
>
>  extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> index 644ab939be1c..852966aa20d9 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
> @@ -181,6 +181,14 @@ static int hci_dat_v1_get_index(struct i3c_hci *hci, u8 dev_addr)
>  	return -ENODEV;
>  }
>
> +static void hci_dat_v1_restore(struct i3c_hci *hci)
> +{
> +	for (int i = 0; i < hci->DAT_entries; i++) {
> +		writel(hci->DAT[i].w0, hci->DAT_regs + i * 8);
> +		writel(hci->DAT[i].w1, hci->DAT_regs + i * 8 + 4);
> +	}
> +}
> +
>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.init			= hci_dat_v1_init,
>  	.alloc_entry		= hci_dat_v1_alloc_entry,
> @@ -190,4 +198,5 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>  	.set_flags		= hci_dat_v1_set_flags,
>  	.clear_flags		= hci_dat_v1_clear_flags,
>  	.get_index		= hci_dat_v1_get_index,
> +	.restore		= hci_dat_v1_restore,
>  };
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
