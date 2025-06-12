Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF659C71136
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHTiwOOO3JMZdWb9+AG9EzSHnozs3pC0SiIpvUyHlH4=; b=q2t/W/M7swVpzu
	MTk7FCFF3+9uPXvfDwTR6YfkiS2u0/iv8p3k3esCo9pTZjmPz1Q6DriMD5XQHvpEK5uJmxGEZK6KS
	eBagChcbfxRelzNQl+iLgGoaszoVuv1mcbeE7pI8UyTD69bvSkp5N+1xU+u0gIWvJ8ZMiBkVbnjnr
	bRkShI9kMPooT9plmCCnFzlgBAwQI8MXRWfPLcABX0+TEevWEMbV5ttJvVIAi/cLDZ067G7qcX6pm
	oWwQ/NumRkuBt4BVzQom77eAT1ch+fk1ldIunZKBsSErjnpdJLP9/c4AdD/19cjnHm1v7ER0OXbAV
	+yaogUbnPTTVQkprFmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsu-0000000EN0o-1vxE;
	Thu, 12 Jun 2025 19:46:48 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPl1D-0000000DyIJ-2gEf
	for linux-i3c@lists.infradead.org;
	Thu, 12 Jun 2025 16:43:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoRjyWg92ar7VLFpWeyHc79lrcqJyDqobb61rgozc0MDXYgY+oTD51+ch7/rZu1HrnEWy8d/zsxGCojulrej9tfZxKRcAYsLDyveaIOHWoCiRSlCy3A0eQhdLWwhm7ShJwRZMipwJIAfxZD/gKGLRzoi7R50rQlQHvkmTL+uXXDjO+bV1arujIyYNyk2i5itYlju4JjxZ1XKMKXGGVIpf2I1aFICG3fBfivLmcGSLbtUqz/2VVeL7uVGgh/f2bc3k+iF/VP+HCWaicfVOcgr83g9vSCWszK2YD6zfeOie97y6z8Hn6P5GuPR8yMxYGMrmg4VQxV5a1d9eH0O0IHInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O/ROJjBtTQetl5NKYCgV50y+Jk0oZTp7N4vzTb8r8I=;
 b=pnQHRu02WVilhvQrewLmlKf6+FmV91M7zwZD3ZVM99XYKhKvAiRKQ+6GRz+4c0uIz2meI4vnNi3gJQRfTk/8tq6iWVbJSkjUqygV/4iIawR9yv0ilczyBrlWaucUjxKB30b2hi6FisZc2fFC8d53LyUk1qCxy1wxW4wbL4znP+EIlCPhhr8VfsRpRRp+XqEdeCJgqd6llMOD/T2PbBhgv+q8DzCO9b1ZDWvtAMjZAZNqmrn5lXOJSWJ4UOgNkEKvxM8zCMnVnD4c4jGBvFrahyV3MuM3cHrX6rSxRFgMqvmqZKZPDj0qnk+JXrlHY0jYc6a9HddEys8qkt3FVQDKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O/ROJjBtTQetl5NKYCgV50y+Jk0oZTp7N4vzTb8r8I=;
 b=dSYzPt0Tysp47Vn4CAH/VyAKEeuwmMr9/J+Xhd1Rjz0RK2XTIWxvsmzXhKfTdJF9VuI+EEXxoT5T12k+IbtMNOFRZNDrmLEHFmMf8iOXjuQtybSr+fH34/y3x3TPOeUZp83xbY48/o9nNIzc8FqsXxpELgKaC8tOhhLgwh1wakx6q2us8AYtNG55ORsNAAMpgd7ElwhxE2KD0n/jT5XsgDSwRzUfdBeVnnlW91KmgVt1eYb18ilHX+KZx6pPUCxrpjF0tf08R0+0Z5ctI/V9iAQDNxz6u4xpm7w+3rhxzjrbhWLYDuFXEX+UvLM0QkV1b5iVZm13EmOt5xELFruZsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 16:43:04 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 16:43:04 +0000
Date: Thu, 12 Jun 2025 12:42:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
Content-Disposition: inline
In-Reply-To: <aErqY0QWMRdC7Pvg@shikoro>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b63e4f-32b7-4d80-f346-08dda9d0337f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZJrBdNHr6Y8rncZrWKiXFwvTkIr1UC7juukkObaEgqctKpv51+KNzNuwrWbZ?=
 =?us-ascii?Q?9j9q68SmDKHqojR8dvTzJsft42U72EaVC9RqYHz55nU1Zx49x+YYS88iJDMR?=
 =?us-ascii?Q?1yGzr/OVppjCrnCT7heVz7FnTSs3+6KC+OCbGX+OQOkgX1MU9RdFHqKKjqIK?=
 =?us-ascii?Q?ekklze3k/4ehr/Wa+TfW9A5SRvfJAzkt9pYQ3C55ZsvFsxJj8n5ESUaiz4B1?=
 =?us-ascii?Q?063p14Hjm4Qwt2rjozimpNqckm7i3vF2PSoDuEC0nQZfUcHxlwrWqkOaoxLP?=
 =?us-ascii?Q?DGbN96jQQTFngPeucL7OLNxvip7p+peYNzA61cljrASQOSG3ywF5BJ5NNxT3?=
 =?us-ascii?Q?tUiidpj2RVkBWOSVWkubEY6BYG9p44RwJdy9AYJpFKzDvQXHWfdpGXcvVgZR?=
 =?us-ascii?Q?s/AsbIwbPgcsERHxKtUiEzAmM0jcMFBzjKJLN4hLtoBvN+1VZltQ8b19Ftzk?=
 =?us-ascii?Q?I0hH+Qy8hdDtA/NcIe3hkyX6by8g/K6cj9wRxFWTXAGDS6agcK1uVSFEHyEt?=
 =?us-ascii?Q?I/eeWfg+8nCw3ic3Dm+pH3cUX38NOv5HepYtKCmokvzyLxrlGo6K0vryRWdN?=
 =?us-ascii?Q?SmTBJ2+hZk78Ebrd6DABoP0FAkJse11wlNa2ukKPaiu0rekj3KOU7iiRV+VI?=
 =?us-ascii?Q?zvh8MwCPZCEb0SshHbyhwq56JmSTYGwp3WUl2sopj0KxeVrJB0thUj77Q0xa?=
 =?us-ascii?Q?KH2M0pSyN6NYDYWzoEb9b2jtCSO32KANeuybnkcTSOPBMP8vqGchda1m2Fnz?=
 =?us-ascii?Q?GcRgDx+r4FlzPnNIFzsHigIOvwmP69V9YutTOqEOiERfoAWFHrLKKo47z9mm?=
 =?us-ascii?Q?22F4drLuNY589FiAp9AN6hsW+aO51vxeXaF4ZysUaL/qdWHGsLBee7RILfS0?=
 =?us-ascii?Q?a6Il8OgW9oftFtgrFPPEZuMetl9568cffAiEvrvMseSBqn/OiLEXOU6xaOkF?=
 =?us-ascii?Q?ZIGpmyd94N4RArhmhJMPvmuHFWOJVwV/Jmol0qZCIVsvxslI9A5nSUbfd0fI?=
 =?us-ascii?Q?Yj1F0E1n60NZAKYF5LRmFCxOoHanIUxcYTssrHQ6L782QchtFwJsUWAxExvg?=
 =?us-ascii?Q?E0pAcRwzQPVTQ7JoTtmThMz3S1knk3uGYzbVACq3GEtpTsCIgVEegFhuJESF?=
 =?us-ascii?Q?LZlwxoKDdq/Zt4BM9tWkrbqEHwzsjCuMYEaHAQBZu7tOoipbOrreIHn1eC4E?=
 =?us-ascii?Q?9dJ+ZSw7abAoghbVx4V6KQjwemOSu0oCpHEuwjoLq89FFVkufueSFHuAhAa5?=
 =?us-ascii?Q?hqc1Vo/3lCgRGJJSEa95aUT3kcproywihcynY6VI5yGI601/8sdTAYfhDH3v?=
 =?us-ascii?Q?wOSJQUrJLKGk7BgbgFs0cj7+riDTlI4+fyJ7LfnaQKz9EvL1WKb6DlGC+2KP?=
 =?us-ascii?Q?pWjq6SHkL9C8Qz+2yN9LauL0wxu23mI4GpOHzCEQIRD4vjTFnkubnGeRzDEs?=
 =?us-ascii?Q?vNhjdtPItcXJKga3kEkYVpFLoFyii0IeFzcG2QlifehsaV0WxxM/tB1y1ucA?=
 =?us-ascii?Q?IfttuOsElSrFXKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bYqLRBeBu+clGuG7c1zAsizCt12ckdE4ux0HSs4EauWUP+7npkeHmyYkvsVd?=
 =?us-ascii?Q?spkJxaxktrfZ39I2b1RKioq2qczU43zU1E311puviBqUCEWBN+1qhImPqgtz?=
 =?us-ascii?Q?3L6cVtDRsgyZLg+XsdPRONRG8dtR6bi7nzdpVkEKjsC0v7ybGV3iZvBcnfKt?=
 =?us-ascii?Q?50Rv0y20u9ATRMKqobJNdMZiqKuVofxsieUg1lcQN8kYFNFFYCUNokS2Ugp0?=
 =?us-ascii?Q?S0kRsVkK0ivptg/KymJS/jyxrrn5s2x5TTgzlDDPpiGyIE0Jx2co7xO2mZGT?=
 =?us-ascii?Q?qBx5UgfLuzOGGjDlm9f++iIDmanT/BSOpLNnbmgNTvnXn/3M63IPT0z9j1FJ?=
 =?us-ascii?Q?QDQNUClHToqzil0MzGhEXR8EshKKTXfOMcaNjPiC0s5dl2Zx/VnagitU8ft3?=
 =?us-ascii?Q?l/47e9L3ImUR4LFZbocBZfl4MVQWlIRjHZ6MeetFLQgRRIFjygTRe1rkEEGD?=
 =?us-ascii?Q?d3ZnGRaovWv4su9XxG5Mtyce65+bmZLppIkP190BBj5yCwF13Bqo8PdNcire?=
 =?us-ascii?Q?NtemAxHpGU4OXYaHcxaGOscr1huFmnbrk9u5Zh3qCWKm3dIlleuIQzkwld7a?=
 =?us-ascii?Q?wvMzruD1fckDugTXGUaUn4Lv76mlOTDoB2mhAzzfAtkGsfLQOf3pRVPd7fpe?=
 =?us-ascii?Q?4ZWujVSxbjXbmwVPXEGrWHPAr63OaBe5CDpmZIEYt+bE4cdFO7N0M6YV8lg4?=
 =?us-ascii?Q?LdWeqT3RbKy/cM/PwHBCu+FJeXLyrDnQSC9qRO4oNEBbQOIWJlbN9Xnz+xQS?=
 =?us-ascii?Q?D7GbL6uY9s1zfN/00NG2l3FMZjr1ejHEYDwJpHgjA0zL7A4m2x8nk5RaMZGG?=
 =?us-ascii?Q?0eUpKqH06vRPQ6rn+0lMPrcnS5O2BTUzqnIae/YSSzeID+ngsEoLuZuOoXlS?=
 =?us-ascii?Q?LwDoAzZk7143BLk7zXTjGcGbR9YPHgj6bgBSp6DSfVOXhc8NvE4nz3u92Qnv?=
 =?us-ascii?Q?Yj1T3v7hAvH7dDw+WGATJB96TYz7nVQyg0UpI9rly0jFvX1+d9dE8MMWKvIx?=
 =?us-ascii?Q?GdWIbw7P3uQYr5uj+d2XCCWXGiCgKgP85FQ+vu8tvkjG3dABe9dmGojQ2BU2?=
 =?us-ascii?Q?HlJxlFSGyAwvlJ7MBSPAZfBCwjjyjkM3szDtEj6G9mhRtrgY17xmGArQcvbr?=
 =?us-ascii?Q?hTKilF65UWBYuGS2j4Ld3HGvRdA+eb1rZKNDe0pqttGuGarMU5h+jRpJX08/?=
 =?us-ascii?Q?R77INhbwvUJnG30hCZpIv6sLFbjGo56c2eSrai9VYVVzLEXtgTNSF2E5PIX+?=
 =?us-ascii?Q?7wmFjjscjGWPF0LBmmCqIg10w7ADzAordEzQ3Wj08ZmDxDCQ8yNPUmhTIMT9?=
 =?us-ascii?Q?BBTIdBZpDunJZKS03ItBDirrHlP2bJ9qSxn9obOfI2s6c4Pt/DJNVRQtyZs/?=
 =?us-ascii?Q?fUgygty8wuCPt/OgXL64tz8DhteYlmNm7PFdbeXKPHC84ZI9zpBufh3DPWdo?=
 =?us-ascii?Q?mbfMRZlMJqIy3BGqQgMQimdDHbj0OrRVK5RdeE2dGO3O+oO7gyAY+z7uoT1X?=
 =?us-ascii?Q?kNV6Xd7yZeFBztfQruFAQZy7YvP51Qo627a7h2Sw6RhLTpP1kvIXup0IUjiD?=
 =?us-ascii?Q?XtlslKN95sUFPK/lGqaIw5THmT0rbIzjqgxZSDHM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b63e4f-32b7-4d80-f346-08dda9d0337f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:43:04.0023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUwhvrblaEhdAF+PqHDhZKwzmRyAynGY9Btt4tcNVH42SlzUgUluI8qkPqPvOMN9ilh2/iml2Oq6cBkmzNxpww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_094311_694527_0AC873E4 
X-CRM114-Status: GOOD (  39.18  )
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

On Thu, Jun 12, 2025 at 04:55:31PM +0200, Wolfram Sang wrote:
> Hi Frank,
>
> thanks again for the super-fast review.
>
> > > - RENESAS_I3C_MAX_DEVS is a constant currently. So, we could get rid of
> > >   the 'maxdevs' variable. I tend to keep it this way in case future
> > >   controllers may use a different value, then we can change it easily.
> >
> > It is similar ADI version. Can you simple descript hardware behavor to show
> > why need RENESAS_I3C_MAX_DEVS,
>
> Yes, for example this register has basic status info per target:
>
> > > +#define DATBAS(x)		(0x224 + 0x8 * (x))
>
> And there are only 8 of these registers. So, there is a maximum of 8 for
> this controller. We could hardcode 8. But we could leave the handling as
> is, just in case a future controller has more or less of these
> registers.

Okay, can you point me spec link.

>
> > > - For accessing the FIFOs, this driver uses the same code as existing
> > >   upstream drivers or the recenlty submitted "ADI" driver. There, the
> > >   question came up, if this could be a helper function?
> >
> > Add common header in drivers/i3c/master/core.h implement inline helper
> > function
>
> Sure thing. I think I didn't get feedback on my original suggestion so
> far. If I now know you are positive about it, I will give it a try.

Sorry, linux-i3c mail list always delay your post, did you register linux-i3c
mail list.

>
> > #define PRTS                 0x00
> > #define  PRTS_PRTMD          BIT(0)
> >
> > Add extra space help distinguish register and field define.
>
> Okay.
>
> >
> > > +
> > > +#define BCTL			0x14
> > > +#define BCTL_HJACKCTL		BIT(8)
> > > +#define BCTL_ABT		BIT(29)
> > > +#define BCTL_BUSE		BIT(31)
> > > +
> > > +#define MSDVAD			0x18
> > > +#define MSDVAD_MDYAD(x)		(((x) & 0x3f) << 16)
> >
> > Use GEN_MASK
>
> Sigh, if you think this is more readable, then OK.
>
> > > +#define STDBR			0x74
> > > +#define STDBR_SBRLO(cond, x)	((((x) >> (cond)) & 0xff) << 0)
> > > +#define STDBR_SBRHO(cond, x)	((((x) >> (cond)) & 0xff) << 8)
> >
> > FIELD_GET FIELD_PREP
>
> Ditto.
>
> > > +static inline void i3c_reg_update(u32 mask, u32 val, void __iomem *reg)
> > > +{
> > > +	u32 data = readl(reg);
> > > +
> > > +	data &= ~mask;
> > > +	data |= (val & mask);
> > > +	writel(data, reg);
> > > +}
> >
> > can you move reg to first argument to align below help function?
>
> Yup, coccinelle should make that easy.
>
> > > +out:
> > > +	kfree(xfer);
> >
> > you can __free(kfree) xfer = NULL at declear to avoid this goto branch.
>
> I'll give it a try...
>
> > > +		if (!i3c_xfers[i].rnw && i3c_xfers[i].len > 4) {
> >
> > Only pre fill fifo when len >4? what happen if only write 1 byte?
>
> Ehrm, good catch. I will check this in more detail.
>
> > > +			renesas_i3c_write_to_tx_fifo(i3c, cmd->tx_buf, cmd->len);
> > > +			if (cmd->len > NTDTBP0_DEPTH * sizeof(u32))
> > > +				i3c_reg_set_bit(i3c->regs, NTIE, NTIE_TDBEIE0);
> > > +		}
> > > +
> > > +		renesas_i3c_enqueue_xfer(i3c, xfer);
> > > +		if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
> > > +			renesas_i3c_dequeue_xfer(i3c, xfer);
> >
> > This may common problem, I3C spec have 100us timeout, target side may
> > timeout when driver wait for irq. So target side treat "repeat start" as
> > "start" and issue address arbitration.
>
> There is a specified timeout? I couldn't find one in the specs, can you
> kindly point me to it? So, the solution is to use 100us as timeout?

See: 5.1.2.5 Controller Clock Stalling

The spec have not defined what exactly happen if stall clock more than
100us.

I think it is hard to resolve this problem if hardware have not DMA queue.

Frank

>
> > > +	i3c->addrs[pos] = dev->info.dyn_addr ? : dev->info.static_addr;
> >
> > Are there extension of "?" operator in C ? I remember
> >
> > dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
>
> Dunno if it made it into the standard these days, but as a GCC extension
> it is used in the kernel for ages. I encourage its use in I2C, other
> maintainers don't like it much. Mileages vary.
>
> > > +		if (ret) {
> > > +			dev_err(&pdev->dev, "failed to request irq %s\n",
> > > +				renesas_i3c_irqs[i].desc);
> > > +			return ret;
> >
> > return dev_err_probe()
>
> OK.
>
> Thanks and happy hacking,
>
>    Wolfram
>



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
