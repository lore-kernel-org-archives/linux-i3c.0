Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82553FF8855
	for <linux-i3c@archiver.kernel.org>; Tue,  5 May 2026 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tf7U76B8qe36GkbaGqwSo5xCGhRx4QKKwRNC0+QPn30=; b=fyVEuJL49FL5Tt
	zrzYjphpCb0aTfsynIDDUOBus5I6DWQBdLQ2eeIlgEg05nOw6WeB9Fvq5CljttclMvgxE6AV9DOnn
	300KjB5cJcqnIMI2ATJJHax5xpy6GU5hATLDZJqsWp4VAb0Ky+rX+pj+EJFPjLjbvPmn12joA8WvO
	jhuwIsI79o2SQ97AmqUwnglwUwM9lktZ7MGjzbTU7z5p1CcKZzSLQgitIzETsXVKodtwEjTw2gzRW
	B0pm0LaSUS+gPohg5cRKtf7TVG7zR7ORZtN+Bu8+A4It1TCEsSg8Mq+w7g2MS6vtiU5AiXprBg8li
	O3OKtgvSvq0HeNKrSXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKpR-0000000HDfj-14BK;
	Tue, 05 May 2026 18:49:10 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKpO-0000000HDf8-03J4
	for linux-i3c@lists.infradead.org;
	Tue, 05 May 2026 18:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W05U/Huu0OVgNOz0xJlnjiISIFPBugs2XXgRPLnRS7hUT6XCZZEZI3lpixkgAe5hSBjnm8GBa2GkA82i740TNHp6bzoqBNkKONZwQEf5SA24VfF2q7tfJXUI/mDVaeEXfIba5uYgAhH23TjZOj3f42UFeJhYgZqpjwRaekxMokjErMQ3Q5boNoqOn+lCCqRhF2DR5HpI8QhyC5feaa7++tzqNHADo3GB+r++/46AfMYLkvt7d23SoyFMlalj2xYM8+Ok955MpxfEObdqQCLs4u/EYz6j78Oi7+maDbK17T7SP3PucPjo3zAIiy7QuinJh+QeLQgRDF6ZGOIMPxnO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/p3xnMzI/NehSyp3YfsQPa0m1/PtQwmZ7VhBQEppVw=;
 b=DJoYhR3qEy2UswfDjUfA8CAYe6X3/OOVPUjDgynmNLgEB9/cS4Y+XuFSz1qrgLKuoa74QPb6X6C2/4EEYP9KNvWQz3k8CJC3LPHDn7ftTmpLlJCF2cL59+U/b/ZADOQRKjGGiTXXXel/NGXKcbzN+Q6X+F/fwthA439Yo99DyhZWbtFbm/wlJiCUucD0Cm1IFIhw65+qYfchXCF1473dTqo9xGt77vqhOa5paRSz6oXHom/kDbTmBA55K193XwaXW0HBf7sWFuVjYlIUWz1NCJJ50RVGE2k3B44kasUMcdPEq1ud+yNppUvX7MRKrqXU3S3WZINAaCCZPEa0Y1Xrcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/p3xnMzI/NehSyp3YfsQPa0m1/PtQwmZ7VhBQEppVw=;
 b=FYlECJgcPBMXybIJEN+jwRfIC6E4tNiffZRbdee7FjgQtvSl/Am1lq16FwI8RaL30Nv+w32+fMV8AKDhlhvVNdCV/F5iP+A8nmcAbLaTMQed7TCknxV1NzvJahfx2jVUsOtDZZaBe8YvQeBUfCCUO0dyCJJlGKfYeXe9aqG7tRcJaxqreHrLF1fNf721/TRSIsXAhl5BTc/RU84GGwi6/hA2JbfD9txzqTt4B5b/3VVq0UuCFIcHdBxkj0mZGU5qfJaw3h7z33RNuEFLBTm0KDZLFu4Q+S6UOW8N+IToeWwQCKQ7oY0GcWT5gbqvehSNmfG/TmsToIxTQl9IBuMEHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8212.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 5 May
 2026 18:48:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:48:58 +0000
Date: Tue, 5 May 2026 14:48:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: Consistently define pci_device_ids using named
 initializers
Message-ID: <afo7lOzIRijBbZ2Y@lizhi-Precision-Tower-5810>
References: <20260504143324.2122737-2-u.kleine-koenig@baylibre.com>
 <afkEsk9Faf8wizWd@lizhi-Precision-Tower-5810>
 <afmEo54iWgk54M3Y@monoceros>
Content-Disposition: inline
In-Reply-To: <afmEo54iWgk54M3Y@monoceros>
X-ClientProxiedBy: SA1P222CA0169.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0f6127-5bb8-46e2-18c0-08deaad6f723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|376014|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: iz9mojY1PKa/1/K6DPrb0o+v75Yns/5AqMum0V5wk5AGnPwK3oCurf6q1pm8LPk3breuzEDkeF2FJkzCPunyzjCnHTJ6t8WU53kw6mpU5I+uWcnTw2VmqlKJPjP4zSq6wDmSY44S2PTCbJo7PjAci2uzmN9K0l7l8Rv5MIDWadrzJNhL6ntiwhbOWtwNp9UkndoloJ3SoUJizfRLVckahlzuq337Zjlie5JKk2kopZpfp1WchSsr96FaND1DvYWApB4YVc9XQcp4qeRHu3NpxDUMqsGiDgjMoVfZfylvAQSjLzjGiINY4WG8WKGW8eGmFtySSp7QUJcOrAeOF5rGWh19puSgtMWNH6n9REyIqVCiY5OaTrNt5i7eV7AerZfE9Ls4qKCCi8BDNWcr6zpaK/zMv8eDGR5nCbD8b3AwRgz8F7xdSxMGIMLcnQevNjNqD90pKklvRWknz+h+EP9peXcCBhyPr5z7nclJmjF6zzr+2+qYpWAgXl97goE9Q/VMphszYXmZUGk4/QTNM2OfxGS8oFmt8UqKBF1FUU8vfuT+//QCKnagV5P+CcTIDNc9DPmfRvYmmNozt3HChr9zUxxyM8FjJePfLEhB4+ONkQ392FUi4GsBg0PCz11uMFz4LXa1gYL+JBJ/u6jWN1RAhKe5fQ3hotJo14OUMJYdXNVY0UY3QkxxH5U5iUpnocq4/wV/hCinIgd43Up36hrlVhkWfK7vw4BQEDK/1mmocWqTnS8jLLG++sbCI1jKhGj2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(376014)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?STK3RAWstUwsX/zPz8Ix3PFZ82ce6p6UsPLfuB4+SQMdiOF2MTTrPr2ViR?=
 =?iso-8859-1?Q?mfJLMythuPCMEiTZwvZ+1ptX/95anG1dXYnY+Xj0AdBvesH0EbM0ys/+Lv?=
 =?iso-8859-1?Q?RtsxoP3ARoHgCKls4iA21QkG67recLTD5ESm68o+xvTfZtJvSjNxhpogKP?=
 =?iso-8859-1?Q?7DpMbMC/gpbeqbfIFcFgMgCEDNxksyo4Px0UbYYNifbewUxfJFKlTtzgx1?=
 =?iso-8859-1?Q?5xOI9PLpwC8tu9iPf790UW1Tz+poGvvqhsi9M5BuVT4y6ozhgnWdKYhqJR?=
 =?iso-8859-1?Q?/KSfnw7tJN0oxGB4v+LmexCboaZlB33hXMAnpA7qqhuDK2gy8MI76pL79W?=
 =?iso-8859-1?Q?oAPvHWigTjaLqdCZYIZ0QsoiVHPDDJDw6wjiOX+jQVX47u0t+YcOlhtsdD?=
 =?iso-8859-1?Q?UIr+/OD4M27zroMglT/ltbkBgZxVsDx58Maq++mELrkkjPyPWlbVJUmOUE?=
 =?iso-8859-1?Q?6PpGXLWPWcy9sBbP3BSrsT72BG6P6GjLm8L7hRQcZtN1mwxQeZMFze2E17?=
 =?iso-8859-1?Q?/55evPDKzoPB/HoXx9m0RvH8gYiD4SQ6GVPwgMhwQ0aJF8SuyQUulIf/r0?=
 =?iso-8859-1?Q?nkenOosLnyWc9WSTc9vqh8VRT/N/f6YkffqjmMzrdTl6Vgssr2hxsbjq9S?=
 =?iso-8859-1?Q?Hs0jE2aPQgmB61dTwNNrxPIaZ8Lt1UHNjc9QwHm/tEIgcSi6flFa9phqPd?=
 =?iso-8859-1?Q?Y8/VrVOMN7Jb6XtKhCH2f/0OGoge3vZMzJJgFqFxFR6qjSVsWws3dtYT6y?=
 =?iso-8859-1?Q?8mciEgFN++WHhYJV0eF0NrtruVD6vF88Fnst0g9w6DLRdYCETlT9VhYCtR?=
 =?iso-8859-1?Q?E/CcDUIBJGei0YKAywWuN7Ys/RgKb3TCXxcwUMy3R1hqdil15lGwd8kF2k?=
 =?iso-8859-1?Q?VTKfeOWFdAvo31/uttBs36hqFEga1ebL9YFL0VdyW354+uXT2X63nj7y/w?=
 =?iso-8859-1?Q?dFZkLP+IR+qvzQmUpLRAW/QdEvTLtKj17AZIWgJxJbGJfp0sFwMOO2AbY1?=
 =?iso-8859-1?Q?rjCW57zsqcqHwQZO/EgaDwo4WXsDhAecAWMTUB0zLRgjfKB8wg9New5LjO?=
 =?iso-8859-1?Q?XrU850ZjxsbVulSPLC2sAo+LGEFWZoUitWFJhW2GE7+M8bOt/Xou8gHWkS?=
 =?iso-8859-1?Q?wZgPvcmM7dp5UiFeEKH3npLjof1PiOQ7Hv7ulwxeEaKO1XL+vFY3KyMlNL?=
 =?iso-8859-1?Q?k6zfyDuqLyE/MmF0xwzp2rtI+l3HT/+X5v0Kv92yf04daU904Q1jE/fMEh?=
 =?iso-8859-1?Q?zzUnEi+OaIfYID8kQ/kNwIPosDZOZ8UMmyZreKnePDGTaLVn58AN+jgQX/?=
 =?iso-8859-1?Q?+TNUNBT5R1vOkzgBuV1o49cbKlVSl36YoklcLU1daIirzjeIDUrfUpAaIq?=
 =?iso-8859-1?Q?D58EyAkkAguWE9PJxjLuB2L1ixdIXoZxUdcJc/QBRu043qh9PmX19tU0Cb?=
 =?iso-8859-1?Q?snJPdROaAf8BFFrct/GNe1iDo7AMfqWU2EaGGGfC3/ZPgeRTPyv4U/IKnP?=
 =?iso-8859-1?Q?l7zbdLxmbp3SwCXm6hEyaJIDRiDu1ul7GcCbQX0lMwjkygo41dzCNJleQY?=
 =?iso-8859-1?Q?9b+KymL4E4Emwj7TFjOeWYVjGzsPExcpJvxJNqoYnvqbe4AfhC6F04V7Ef?=
 =?iso-8859-1?Q?PTra5AG6enEsy8a/tPHq0Dt6hG9TETX0q4oKW5cWWJHKQnVqpHT2PmN6TO?=
 =?iso-8859-1?Q?j8pAZ2KhCLHek8ICDo6zdFZecvkY5TU7OnB2focS9124J/9sYKTtiYUbmR?=
 =?iso-8859-1?Q?Ets1jUZH4Uk+SEmexV3fE5Ic4rCAfeHK2QrAhJGBxHD1YP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0f6127-5bb8-46e2-18c0-08deaad6f723
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:48:58.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q23RoS3jI0SHvT8cYJzfK7UQ6q8O61mr1PGtljOqM6X0Jy6pdFaeZ1RgIvcwt2QZDi5TSfsNNzZLIpqS8F9NfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_114906_059397_D3D69A73 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2026 at 07:50:16AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Mon, May 04, 2026 at 04:42:26PM -0400, Frank Li wrote:
> > On Mon, May 04, 2026 at 04:33:15PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > The .driver_data member of the various struct pci_device_id arrays we=
re
> > > initialized by list expressions. This isn't easily readable if you're
> > > not into PCI. Using named initializers is more explicit and thus easi=
er
> > > to parse.
> > >
> > > This change doesn't introduce changes to the compiled pci_device_id
> > > arrays. Tested on x86 and arm64.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@=
baylibre.com>
> > > ---
> > > Hello,
> > >
> > > The secret plan is to make struct pci_device_id::driver_data an
> > > anonymous union (similar to
> > > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@bayl=
ibre.com/)
> > > and that requires named initializers. But IMHO it's also a nice clean=
up
> > > on its own.
> > >
> > > The anonymous union will allow changes like the following:
> > >
> > > -	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data =3D (kernel_ulong_t)&int=
el_mi_1_info },
> > > +	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info=
 },
> >
> > I think it is good. Can you directly change to to
> > 	{ PCI_VDEVICE(INTEL, 0x4d7c), .driver_data_ptr =3D &intel_mi_1_info }
> >
> > I think use anonymous union {.driver_data; .driver_data_ptr} don't impa=
ct
> > the current drivers.
>
> I cannot because pci_device_id with the union cannot be initialized
> using
>
> 	{ PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_mi_1_info },
>
> That's why all drivers must be adapted first to use named initializers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Best regards
> Uwe



-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
