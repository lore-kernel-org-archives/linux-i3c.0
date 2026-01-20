Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546ECD2629C
	for <linux-i3c@archiver.kernel.org>; Tue, 20 Jan 2026 20:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88A3/gh7CE3XI4NZFRvy++7Rc91eQ3tmQEyG9a6dGZ8=; b=uR7NoKf+2YnSIV
	ZiVtWDI7lxMAstI/Z/Zp4PQM4CRnD8bertwoQBGyOui3ke/6fv+I/gH3gmOGRmL3WK1R3+8fGiPNp
	WCe3ANwFxfn9B3YTi9xXm1DEp0jQ/O0W+D8rM80cUixYFElzMM5AuHITYdKs1JBeIm1qWWC9FZO+u
	UefDUUXB5roOREIS9gMCBbSzrRsMgfExFQxZ/R43rWxlII7sQkb8aV5Gn5gmW5V5wRxALk0ppFfUe
	6LeRLdHip8mju5p66cL9Kmk/eHyUsHG1QylKPt3v2CkpQTimXI+NNjXtbDuGChkazZYoSwMIhDJTm
	f71+5eCW0EwP5hrqLPBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viILa-00000004RBO-0GHg;
	Tue, 20 Jan 2026 20:29:06 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viILX-00000004RAp-27DZ
	for linux-i3c@lists.infradead.org;
	Tue, 20 Jan 2026 20:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMpSTf0vpeuRNCkbJl23CiO3JC1HqXhXWiC3fRAFbcKLRAr1YT2BKwPODaCnwW1BkcNxysb694G6hf2NQWsma1//VFsRxTfSZKM1uJ0ANq1AMqqHyvOhb+DKkg2GPQcyS+hQT4XnMbcZ++SQcjboPRrByr5zG6KEF9IBIIqtwEjoXf4fJanbZ21j+K94eW/SoTs4FPXITx1rwdUQ+iqhJxrsnyJEbQizI2XPBYgp/db20rgzZSTOr0S9BMkIWnPwlSDeWl9nxTl4OStZSUEegP48T7H6WylzJtu8+xGksL9BovCJES/uSLOdva0pnXsyrFNVjBhbt0Bl0i+li+IfkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP52e73pVhHEfMEJ+VCMmOriGyfrgMX6ev/DIP/9tQg=;
 b=pvToAWnlMJq9FGdd9GMYqAsz/q+b+aFeSD+R17THxPGnBklpvK2GVe3M2OrQ+4vjN1Itsm/LijpN+hd4XmF8G7uuKKNjCfw3j64ez63fYd4DZVaGN3WsLrusOMcyllugm8Asq682iMNKQuC2XyaQ1UfRFhcH+TuDlltvV0MPY9zI0+Yb8v5z2bVo9AF16Cy6XMpQwhPPnw/SgG4e6QEXsfdnjRLbTzPoN0rtdpBV/b97rdsUm+ji/iq6+L1k4jn3FJi0geympOu1lmexEUIbWULsbzmlafnD6QXLrIIespUGpKjTmQMIgKli5aAVb3YEHJAlleZsgTHo7ajSb9CE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP52e73pVhHEfMEJ+VCMmOriGyfrgMX6ev/DIP/9tQg=;
 b=Wu4EyPRfjAY3vIjPHMDlMzC61TuE57fIlzXb86dx07S3NyO9xxrkI6Z49w59ZbVkQ2Ao8jkeMDGSg85UNodDdK7p0da3ERudAQPNydZsVvIFWC7gaiZw5Saco0I4eOzQmaI0VxvMFqIuXO4KRy3hMM3O8vDqgmGwbecLA3nZ4XOz9A7SdGO0MWgdMkq+4ubBzRDB2Xc9g3aQS6RzhOLn+YApBwDjUlM9iEOUsFXUIorGiaHdiXfHJcXEmfG+wU6owG+LCuf79khEZh411UlSDDy4qkF/fEx3xOIBFt05Im0Fef9RLFmv2ikSyHfxaBXjL3TdNnhqSuyOqeW2hjXIfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB11018.eurprd04.prod.outlook.com (2603:10a6:150:224::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 20:28:57 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 20:28:57 +0000
Date: Tue, 20 Jan 2026 15:28:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	david.nystrom@est.tech, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V3 1/3] i3c: master: Add i3c_master_do_daa_ext() for
 post-hibernation address recovery
Message-ID: <aW/lgOBOIH2Bj9wO@lizhi-Precision-Tower-5810>
References: <20260120183735.60654-1-adrian.hunter@intel.com>
 <20260120183735.60654-2-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260120183735.60654-2-adrian.hunter@intel.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB11018:EE_
X-MS-Office365-Filtering-Correlation-Id: 34fdc3e0-797f-4512-d7c9-08de586289af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KyKMUE1+pR/Sc2dgH45a7KOeber0oBA4Bdz8Cad9fxqCpQW400xTXWZf3Xsu?=
 =?us-ascii?Q?wASwIDQ/nekBxAez1g5z5asRa98A7W7Qe0O0dZ5tllsBMuGuAnUuZ/eUr7p8?=
 =?us-ascii?Q?UBRwP4m6WkcJF9fxohxm8OzeF6yp3dA8UMNMI+MVGIbvSQIKbkfj+amSQ8Xk?=
 =?us-ascii?Q?kJeNgC6Xp05qCdJUm6RR5+zuHmL36mt5GfP5nvFhee/KACYo3z4fTaO+trmz?=
 =?us-ascii?Q?SI30LPD2EACIJAwT6/O+B6Zgtt/TXzk8I4lPPjaodIAGHyjsyRaYSzcu8wIk?=
 =?us-ascii?Q?aZiubNrw54GY5H/n3jbCt12N+EH9F+2oFniKdTBjmm+vTnju300fA3ok+4aD?=
 =?us-ascii?Q?wApB83BJI0z6bVYbUsQF1c2R2AOgru+79y6KcwUP6XVBSlmSk1ulU6GkrVdn?=
 =?us-ascii?Q?4MSL0uvdAGmIgYrHFefLjK3AuC3CPlkuKBeJBuvrA9CYwIBE7VsubZeeClOc?=
 =?us-ascii?Q?7KdR00O81kcL4fxpcPpE3ah6+BWEG/+w6VIWWjyrjWxHdMBY1agwKa2+ZRRO?=
 =?us-ascii?Q?J9C6pe8wDpsiA8l4wdffbOFCmtZDT8OzDWxxSUcN1HBMT2nc77FCBJmVgTDb?=
 =?us-ascii?Q?lrAzAP4+VWU+CoWNK1O5EmX6sE6KqxAi1FeS5uYrlO3jfR0jOv77A+4QkYCV?=
 =?us-ascii?Q?3lnX4lEXMmxgJchzdPazPxg+bek0wtlbdEvMFJtwjJTuvvyZhlBvBJm+apMU?=
 =?us-ascii?Q?ki3cV8L6Qj/pIj/OpAcTUM/wbi7G74aGi3IYR27KFuR1bw9uY0evx0sbSDM2?=
 =?us-ascii?Q?GF3JG3Y0i7u+F1ETz0Zmtw5sus4nuCSC+rFbNwWuDTJpWjpB6ZzY+KOrlp9f?=
 =?us-ascii?Q?9sSZfFJeHfrxS6Sg7DvoJwHJw0iW9t6JdXCnRLaK506VGiN04eGDwaOsEeW4?=
 =?us-ascii?Q?fB7VXBn46SLeWlD+BrQpqZFchbLOGkLbCBo/YX3Hzr3W0p/228ocsZW/oB0r?=
 =?us-ascii?Q?Jlq1CYzbGeuQYPnhFiB7Y4u3REWXMzBjHK0Z6573XALVjctCeiRvKooROxdI?=
 =?us-ascii?Q?AaCwAJAR1JTBn12d+U2HxYRGfQuZnB14V4OL1z7AuXjdO1HgpiyyuoWH7RxK?=
 =?us-ascii?Q?N3O+yGswRA+/XD9eHQX1RJkzXFzDeRLxpUdUkXOnMe21TDuIM3EkYjjYSxRo?=
 =?us-ascii?Q?CfxVegDcubIOQ4dmAHVRmPYSXDe9JWzGeUOc/pxSOpo4E4K8oaDe0OKwgtLr?=
 =?us-ascii?Q?K9JLu8b2dMWIkyf1xTk2Jkf9Zno/trzbCFWFw1NTcQ/xEI2dNVsHQcFpveuw?=
 =?us-ascii?Q?zttPKX15GKqVFa3+QPDtbuW9V4bwmkRZ+Wk5ob05SAFv+SS3oQYii9bW5CxC?=
 =?us-ascii?Q?VpGdG1Ke++Kd2cbGB5Y1TKd2Mly+MJ8JnV20nvqA63ajlkHut3EmLvfaOwnS?=
 =?us-ascii?Q?stJtq8dQ43AVvUAjCodEBDxDdr8TDz7o9K5YxR5w4IBWH1rHT0kU79gH6x4V?=
 =?us-ascii?Q?XftB4EqY0zBa01wb3Mz/Uz7utH7qOa7oZ6rxYwp9lwDeZp6PrVJI58x2o36f?=
 =?us-ascii?Q?SqTj5z14bPCy76hIIdhhkF+9CsfUbSCHmYJNAQP9NI19KflCNNUmvzuR1Lf4?=
 =?us-ascii?Q?RXmvQnoNYEpxIL3+Y7Mq2C+DnR3jNeRl4se7c18zZMIQw6S5ZOb2J2oKocMq?=
 =?us-ascii?Q?wFJ38bM9tQwtE8Q8+17RoEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?80C7/zF33QOiyhfU9gTYEtckWQxMXopDfe8sY5T6rJUUAf1YceXXyvBISd1J?=
 =?us-ascii?Q?NFtNPUcgzS3WhQTEy6jNKXnQFSO3YGSEMg3LkOpfdiDRn/rkm/rveszDGhe4?=
 =?us-ascii?Q?SdB7Gt5Wf5cz7m6Y0ZMXi3BGgnxBTBKdJx0lMA2vD4SbI8OY02jZ/xRbQJyU?=
 =?us-ascii?Q?yD0d8sbU/dc2GDvXiym5W08+20aFWDrKFWbXlycGp78gQZ6gADZCktZ7mXq/?=
 =?us-ascii?Q?1t8SwNLorzPVZNAYV1PDLAsTsVrOtw+wfyDUzIosImY3LOTkB9AW5tFDStoe?=
 =?us-ascii?Q?f/5mNku7w1TDclWVwTp78ZX29/u6iqELUq+f4JitfqeMFJDKYBpGbCat1WBe?=
 =?us-ascii?Q?c7I1kphHpZYDMX0w3GycCDC8PWZhXrOo0IGSdS5Xcl8Q76rewhmLlrL7ZpUK?=
 =?us-ascii?Q?zCk0i53XdQ5Kh+QEPMLwA1+4asrlS9BWaIaKMqTPfPiW629+44Kry0rNDfV8?=
 =?us-ascii?Q?1nGi8YXOQuoLb5n9YCoih3nWzjBbd2n0xgKafy3hEUYWBGnGDJdBTwzyLlh+?=
 =?us-ascii?Q?qPYslPXaelnx+TEXChA8CETDXidbUr4GKsamirIZ/rN5gTRjRXQT1zsg7btv?=
 =?us-ascii?Q?LxYBMwyxHx0ypMgBpDvFvfiaB9WxAiPYWP9NV5M751I34iHiShoqcwTYIh6M?=
 =?us-ascii?Q?wM+GGhYeLbQEjJ+uRViOr8azwFKnt6K0hDFwDUpwgTi+wvr7fc/zWAEe0W3a?=
 =?us-ascii?Q?u+61kkX8A8Xhi2ZvunswpIPWCXRbXks+qHYV3x5Kand6GOWFNyAu+/OHmk46?=
 =?us-ascii?Q?mRDgM/hDw4dZx16F83R6MXvoeWHjkNvz9Jv9VNaebgjK6c2peSbrPtvTmaKV?=
 =?us-ascii?Q?dexkWiPy3rOF+Z1qy2nPaYp0jUfhQL7J8HZEZqlB7hBn1zgAmO2Qvq1StpFH?=
 =?us-ascii?Q?bIdkNQ6FiLSIKuJNZdv6IGikYfKwdLwM/xZUIXm6vcm7Pa1+x8GJXTblcYlB?=
 =?us-ascii?Q?qVjKbrYK6JChVuwxl5VyN3kyhoAzdP+KGLs3c40JxPLP5zNozD5gxR44T8Xb?=
 =?us-ascii?Q?XaDma5g82GJTDbOD2bf7ye7xFsEVk3iea+nm9vhph4s+jFHGno+3Qdt6TRGV?=
 =?us-ascii?Q?JyuF3eJWWfoc6Qr6nQ7xB6EzT4d8KrKPVxm9FYC9ArGESrDvTqk170Va/7GQ?=
 =?us-ascii?Q?elgo6SW50v7X9dJFhL1tenAdAa2JIDGRiI463qKr5DhQVE6Oei6G4oDgJHxN?=
 =?us-ascii?Q?asGyZ171unBHAYuQ3yjxfJCAeFEQy++u2AePhByJZSf9BV7MmhxTXiX517W/?=
 =?us-ascii?Q?B2y1RN3IBqu2wnMdlvrsScCGRIGHIkDblXfpaMBZ04FOo94UKkaz7W30++HU?=
 =?us-ascii?Q?RTSxdF4yDaCCHEtbneiA4I8oheWQI76NTtpLg0D1xh9x5t6LIRYc8M4hxKpE?=
 =?us-ascii?Q?+mBeotrz5qI+XNLxoErms2mycRBMkmif5U9WD3cHnhPqIcOdnWHaqAQnKyFB?=
 =?us-ascii?Q?qWoP5R/RzxbwQxrl3zJ9NmoBnTJEAPbZVxZKT1KVJOd5kO2v1nDZ/UWEiZkP?=
 =?us-ascii?Q?aysaWbfCiIwBHBEV4Xg7pMEHu1fDCLMtDiC9OyXsvYrqTkhw2AbvTuZaz0C4?=
 =?us-ascii?Q?NqRR6w1dtOQeHMdRzIasoAFJ/z4yAfEFWbJCIYmDk2fQuyuob+GLR59zz0SL?=
 =?us-ascii?Q?ySa/NLXB5iAFQP7NENDozRe8ekCdNwxOZby2QuvIaar4XaGmWLIWy38+Y/QK?=
 =?us-ascii?Q?k1yekctJywwo/EfSzYYESqyvZ94T3zQeI4bU9PZKHcLlTRLi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fdc3e0-797f-4512-d7c9-08de586289af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:28:57.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCs4jAGl6oO9p1VWOz1mFWZTHldQ94FIu/OtKdgHhDntGqA25p8bQLMlF8MvigK08kQP/IdJR8qdBhBqKqp5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_122903_550984_22B0B378 
X-CRM114-Status: GOOD (  32.49  )
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

On Tue, Jan 20, 2026 at 08:37:33PM +0200, Adrian Hunter wrote:
> After system hibernation, I3C Dynamic Addresses may be reassigned at boot
> and no longer match the values recorded before suspend. Introduce
> i3c_master_do_daa_ext() to handle this situation.
>
> The restore procedure is straightforward: issue a Reset Dynamic Address
> Assignment (RSTDAA), then run the standard DAA sequence. The existing DAA
> logic already supports detecting and updating devices whose dynamic
> addresses differ from previously known values.
>
> Refactor the DAA path by introducing a shared helper used by both the
> normal i3c_master_do_daa() path and the new extended restore function,
> and correct the kernel-doc in the process.
>
> Export i3c_master_do_daa_ext() so that master drivers can invoke it from
> their PM restore callbacks.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Changes in V3:
>
> 	Rename 'restore' parameter to 'rstdaa'
>
> Changes in V2:
> 	Helper function is now called i3c_master_do_daa_ext() and takes
> 	'restore' as an argument.
> 	Fix new helper function so that RSTDAA is conditional on the
> 	'restore' parameter.
> 	Subject and commit message amended accordingly.
>
>
>  drivers/i3c/master.c       | 49 +++++++++++++++++++++++++++++---------
>  include/linux/i3c/master.h |  1 +
>  2 files changed, 39 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 594d61edcef4..49fb6e30a68e 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1735,22 +1735,24 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>  }
>
>  /**
> - * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> - * @master: master doing the DAA
> + * i3c_master_do_daa_ext() - Dynamic Address Assignment (extended version)
> + * @master: controller
> + * @rstdaa: whether to first perform Reset of Dynamic Addresses (RSTDAA)
>   *
> - * This function is instantiating an I3C device object and adding it to the
> - * I3C device list. All device information are automatically retrieved using
> - * standard CCC commands.
> - *
> - * The I3C device object is returned in case the master wants to attach
> - * private data to it using i3c_dev_set_master_data().
> + * Perform Dynamic Address Assignment with optional support for System
> + * Hibernation (@rstdaa is true).
>   *
> - * This function must be called with the bus lock held in write mode.
> + * After System Hibernation, Dynamic Addresses can have been reassigned at boot
> + * time to different values. A simple strategy is followed to handle that.
> + * Perform a Reset of Dynamic Addresses (RSTDAA) followed by the normal DAA
> + * procedure which has provision for reassigning addresses that differ from the
> + * previously recorded addresses.
>   *
>   * Return: a 0 in case of success, an negative error code otherwise.
>   */
> -int i3c_master_do_daa(struct i3c_master_controller *master)
> +int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa)
>  {
> +	int rstret = 0;
>  	int ret;
>
>  	ret = i3c_master_rpm_get(master);
> @@ -1758,7 +1760,15 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  		return ret;
>
>  	i3c_bus_maintenance_lock(&master->bus);
> +
> +	if (rstdaa) {
> +		rstret = i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> +		if (rstret == I3C_ERROR_M2)
> +			rstret = 0;
> +	}
> +
>  	ret = master->ops->do_daa(master);
> +
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>  	if (ret)
> @@ -1769,7 +1779,24 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>  	i3c_bus_normaluse_unlock(&master->bus);
>  out:
>  	i3c_master_rpm_put(master);
> -	return ret;
> +
> +	return rstret ?: ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_do_daa_ext);
> +
> +/**
> + * i3c_master_do_daa() - do a DAA (Dynamic Address Assignment)
> + * @master: master doing the DAA
> + *
> + * This function instantiates I3C device objects and adds them to the
> + * I3C device list. All device information is automatically retrieved using
> + * standard CCC commands.
> + *
> + * Return: a 0 in case of success, an negative error code otherwise.
> + */
> +int i3c_master_do_daa(struct i3c_master_controller *master)
> +{
> +	return i3c_master_do_daa_ext(master, false);
>  }
>  EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c1ec597f655c..af2bb48363ba 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -598,6 +598,7 @@ int i3c_master_get_free_addr(struct i3c_master_controller *master,
>  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>  				  u8 addr);
>  int i3c_master_do_daa(struct i3c_master_controller *master);
> +int i3c_master_do_daa_ext(struct i3c_master_controller *master, bool rstdaa);
>  struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
>  					  size_t len, bool force_bounce,
>  					  enum dma_data_direction dir);
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
