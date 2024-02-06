Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5D2C4828D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Feb 2024 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4fkhdm1DT3Ht0kEAjpc1Emrvbq/62laaPq3lnZHQ08=; b=UM1nHUOwz+dweu
	9dW9JBqVDPi1VKjOQekGzBvvhd1h5h4CgZP3+skObDxZRL4tuq+LLkaPxMT4D8iXmz2qZLkEWAvdP
	TSaLZxnpDMcbr1cyggnv/iakk/xywN+wZ9Cs51fKamjrbo0ntbFN1BXjG4gHYDmgFqmZeWCw7T+wL
	DO0E1X8WKfMXnoNcz2AMcdxSusJTonm373/odjuwOwew4uBTWvVQ23KUTO1e0zqwtDblELYq6Asdd
	f0YTrgHQYoFgWjrDThqTSJXjBXfJA5v/5itsEsHpvTb3kz1xagTlPr82GNdcS3FQTkVwHY80r0Ea+
	7SumTZtuBPzJbFWh9cJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNI1-000000084hH-1CNW;
	Tue, 06 Feb 2024 15:23:13 +0000
Received: from mail-dbaeur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260d::601] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXNHy-000000084eb-3sMF
	for linux-i3c@lists.infradead.org;
	Tue, 06 Feb 2024 15:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlJqNhoUPxnTA3L+dn9WEKfGnpsTT7rAiezeG4zc7XUOmcvol5jxFi0cJfOWaCC10MYwFYF/TpjGiMDcV62kqx//4hos1Tu6vzu1geNTMuro209EpiMAn2VqTGBWqzGAeqkyswFykaF+6l0cZailn/ZM7IYUnjR1cPQ7SprdAXE7IWLlgjfJ8Mi+tLyLjP5Hcxl8SSX4RJffN8InbOYHN1QXxqLhqkSXmJENKJLHdwY72nUll2DH89+/NuzjGWyieVyhUwVYwXXhMA2m/eVG0ZiACr7LPNPUkK52LLJK6lP4zrziqFlhtEc97+TijHqpG6sfjvE1RsiivoJP9qlmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gUZZxx38fB6OkPHG7WJuIb31fjqYEyeKW3RnVc72Gg=;
 b=GN1YwLxy0iYwAzhEzmTJftFFo8I0lDxtBu7vF9IPw8I3GUuBsa0u6fIJjMxuDHy0NZ5maPX05yi1t6CKfqA2/KP2Q5ufkK2M+uDjesdodUsdQVwHR2noDwtZBwcGLoe8YG4inC4PC6tXoLa+4qA2khS639ixBHw2tvRLTjOKPcxg+/UkTyOSb06wkz2re5bIBZgOeu8N3HIvMuXSkJp2Xpf8MS9DgL0IRUosiArOlvxSATVzwAt4ptyUS0NSRpXBlAiqedWRS30chxnMVme2VSzpgu/c3CM7X/jlmXv2IR+kNewtFJeVxvvVsUTf++a0aNdoNYE0wv11hCj3viSzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gUZZxx38fB6OkPHG7WJuIb31fjqYEyeKW3RnVc72Gg=;
 b=TQ9uC3nLqS3r0b01gPf6wkEL2Rz1O1WcmjRgixvlaXhsZ2hsNZBGksp8M1UQlyqPAWPcg9CaYzsqaO/Dv9Od76leMKVVuexIbQNQdb/5wupo0WkzP7mAbEILT4boXLH9FvGyW22JEfOoGeVMuztI/AmivQ1Xpi5qEzSjknVIXQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8882.eurprd04.prod.outlook.com (2603:10a6:20b:42d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 15:23:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 15:23:06 +0000
Date: Tue, 6 Feb 2024 10:22:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>,
	joe@perches.com, krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org, linux-i3c@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	miquel.raynal@bootlin.com, robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v7 6/8] i3c: target: func: add tty driver
Message-ID: <ZcJO0u8rKgrIH4k8@lizhi-Precision-Tower-5810>
References: <20240205233326.552576-1-Frank.Li@nxp.com>
 <20240205233326.552576-7-Frank.Li@nxp.com>
 <9b5bb389-4238-0a32-5e16-3c62ea6c00e7@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <9b5bb389-4238-0a32-5e16-3c62ea6c00e7@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 884cfaad-1066-44d7-abfa-08dc272784e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T7Zbt+NFSYapiuFHtEytalNkj/r3AVS1f57KnVRvKip4Ba0354DKjDBCD7Gj3LJGKWM6cnJzQpWDIg3Yxj2OwCnVbfuKlcUO9frhthRSaoiHzQjZDO28faZTq6gT2K5xu8s7zYR30dRN/zCuu+l2mk+n/IX5lXCtlu3AXlFKDdh2iErwCIrNglHFx0Bo1h43cg5li1wquE5Aat2sb6pBWaq3Olh63gKSDwzFFlOxGx4fX3rR0/ckV6CzIppCDuAubac8nIdnK7nifFPVGFinrC1fT2aZH7Ny0FDRQ9Ddi0ZA67deQXqTLGld+ebghFVjPvjRxrLK6b82ZfTI5LpX/ua2eZ9UAawFHkQmW9QO5xDaaRVDFqgal6Qj7ge3CIW5qL6lqjBNhdMhnxen9WOoYFNzPgKzSwnsO0mxD6Lj2zFZ7omfCcICe+LSLIHGBbwBK6aPbiBk4pd/4MCXga50KiSDr8eLervSTTZyDHc7YbN/jlXSjz+Wz/3ZUi79t5i+1zaqjfLzbpk+dRBNck8gmsWRkeJY1o0j94JXZ3JIwzf9NlfHwaX6WFLo4jxruXk/a4rQ8ObFNypQxYSJaYC9AKB6Rj0ul6avhqpBntXizbokOp0NpYpdwZ/RlG1OYiz4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(33716001)(41300700001)(86362001)(66574015)(8936002)(8676002)(4326008)(7416002)(5660300002)(6486002)(6512007)(52116002)(6666004)(6506007)(478600001)(9686003)(38350700005)(26005)(66556008)(66476007)(54906003)(6916009)(316002)(66946007)(2906002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UfXdN5IgbIHYjHGFrHxTAjTZK/ics5mdUtfmdNiMkDs561BWuNXhXtuoFF?=
 =?iso-8859-1?Q?7Py/2GsdKFnIbXC7QW0UF9YJmhwBTzdQwWOms3lVrVuoufDhmsa3zT3/+k?=
 =?iso-8859-1?Q?whMZJAxc4KtmZcXgokZw5vuQKWmE7jKSTvsbG20MJnpSLvhg1lvIDtKGul?=
 =?iso-8859-1?Q?emSr/7v74NJOUL6qpgoOes7qq70+h5KQaeD1fPSC9tCstwIsAYwZ5H5FC6?=
 =?iso-8859-1?Q?eZBuJu/rJUt1Q0UfYVDgpcVcexKq5e5NmcrbvpKyBdwMS2i7xxaRuQPWPh?=
 =?iso-8859-1?Q?Ph4F4kB6hF7YmTB5vJTFd5g2B4o/dDS8P9D9SK63+GS+6jE18tVnojSKvZ?=
 =?iso-8859-1?Q?rCBkpxhZ5qbwxkt13CoiJFTkpL9DjnKrC/cKzjoxRIj0XHAoJc7zpl0mA0?=
 =?iso-8859-1?Q?Wr4VTwvQsH908uI+xbODAQ+oi1fT1w545COopJyHulUH/YbS/dvH7WfJTq?=
 =?iso-8859-1?Q?ocbleyuE7SIrYbRCMZlEoDyLE1aEAJxUmLX5vAsHxcJX7JD3KXPKS+XQb8?=
 =?iso-8859-1?Q?LvxA9UgqKsFw3Jz4vZWkSSqpCqGlA0vivilWctp85THkLpF/zTE0SGeKZ3?=
 =?iso-8859-1?Q?COkaDk8fu9CeKBEAD0zi2YqaRC91rRlkL05gw98sd0h8MjWovVjR6rB7Wx?=
 =?iso-8859-1?Q?WBMTPtQo93D/poASucllwdTT5n6UfrzKbFSfw3LLi5U6y7PytTnSXQVp/E?=
 =?iso-8859-1?Q?a1sXPjDcDvoo+llD+5AxN6Axb8CMEFu2hj6gv0DnkMdJj9Gk7gCEQX4umZ?=
 =?iso-8859-1?Q?2Jh/03XZtc/+1Z0TVyR8/dFKoHNA/roJab26Spw0DVkiDqSeHM4BKNVFfw?=
 =?iso-8859-1?Q?Ub6Qv4DpH6E5MANnFz8LX7ZLjahlu/jZBg23H96mqZypCqDYymS5iaW/V4?=
 =?iso-8859-1?Q?wwAV90Xnd3AaOXhEp0NZ+mDcOQB79VpoznmZs0YXtqpsPD7MYqUozKKRBC?=
 =?iso-8859-1?Q?hs0PbiwI5p0m0nT4KjdXK2WvSlpNmMx63n6zVwl5tCjXtVz1+LpeGpu2QR?=
 =?iso-8859-1?Q?o0L67bVpdtP+jDXWVyDWOS19R3RYHtNZJa1klUGJkSRMZd9+kDdwTv9Sp3?=
 =?iso-8859-1?Q?+r+Q5Hq6gbkTL+komr3IgR1WfoOS3BmwULJW+Fbc+5TJmGW5gdY2BMghdk?=
 =?iso-8859-1?Q?P3xoraGZ5ifk9sxnJvWaOrVmf+TyyCFQQSZnxPaQXuJ2CNQZYSpm202e6E?=
 =?iso-8859-1?Q?RG7QmjTW+Ux+m1iJEhBr+QOtkLAgMkNvvU7/F3FStxI7b2huPrR8qp2Wlb?=
 =?iso-8859-1?Q?XnsDu1R/QQjX9pV+kHn7IunyxZKvDyurY66sYBJzXZak5vj/xfoPKU4X0z?=
 =?iso-8859-1?Q?btGV+ciu+Lz34h65nfV3RVBXm/rlmHcz80bdWEdNVXttpiKw0uAWfq27u+?=
 =?iso-8859-1?Q?HGTvaUxIGPreJLj7bjb6hgjvC6bWeQBS0WY/Mzf+WTZ2RH6lbDhir9YJbq?=
 =?iso-8859-1?Q?FKbZoMwWSp2EothIRyb4+KuS0L1vR4bkxVyHjj05rV+znlLmA42/KlDEAG?=
 =?iso-8859-1?Q?DgmvnoC52qNCmVo+X44ZtLPJcb35NPj1C9SOiWsuzkHafRL/32iHGF6LoN?=
 =?iso-8859-1?Q?yKZWIJPmzobrVORIfYYP9n99bEdoaBXVC2EQVkegTlwFT6KmW+iivRIods?=
 =?iso-8859-1?Q?g0EG4Bazy5jUFlXnjK07a1GrFaPtCWG14Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884cfaad-1066-44d7-abfa-08dc272784e9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:23:06.8389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NJpFkVIWPU6OndC7OYzLjQVmSj56ZHRqG3wxM4scO15JWk7VxnVwW3h2GYjOr4aB6T14/YAXnzSE3kSs/4BKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8882
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_072311_003581_264F3F20 
X-CRM114-Status: GOOD (  23.94  )
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

On Tue, Feb 06, 2024 at 01:54:42PM +0200, Ilpo J=E4rvinen wrote:
> On Mon, 5 Feb 2024, Frank Li wrote:
> =

> > Add tty over I3C target function driver.
> > =

> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > =

> > Notes:
> >     Change from v4 to v5
> >     - remove void*
> >     - include bitfield.h
> >     - remove extra ()
> >     - oneline for struct ttyi3c_port *sport
> > =

> >  drivers/i3c/Kconfig       |   3 +
> >  drivers/i3c/Makefile      |   1 +
> >  drivers/i3c/func/Kconfig  |   9 +
> >  drivers/i3c/func/Makefile |   3 +
> >  drivers/i3c/func/tty.c    | 474 ++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 490 insertions(+)
> >  create mode 100644 drivers/i3c/func/Kconfig
> >  create mode 100644 drivers/i3c/func/Makefile
> >  create mode 100644 drivers/i3c/func/tty.c
> > =

> > diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
> > index d59a7eb83d13a..fca808cda87b3 100644
> > --- a/drivers/i3c/Kconfig
> > +++ b/drivers/i3c/Kconfig
> > @@ -48,3 +48,6 @@ config I3C_TARGET_CONFIGFS
> >  	  the target function and used to bind the function with a target
> >  	  controller.
> >  =

> > +if I3C_TARGET
> > +source "drivers/i3c/func/Kconfig"
> > +endif # I3C_TARGET
> > diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> > index c275aeae8970c..11f026d6876fe 100644
> > --- a/drivers/i3c/Makefile
> > +++ b/drivers/i3c/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_I3C)		+=3D i3c.o
> >  obj-$(CONFIG_I3C_TARGET)                +=3D target.o
> >  obj-$(CONFIG_I3C_TARGET_CONFIGFS)       +=3D i3c-cfs.o
> >  obj-$(CONFIG_I3C)		+=3D master/
> > +obj-$(CONFIG_I3C_TARGET)	+=3D func/
> > diff --git a/drivers/i3c/func/Kconfig b/drivers/i3c/func/Kconfig
> > new file mode 100644
> > index 0000000000000..7115129eb7d5a
> > --- /dev/null
> > +++ b/drivers/i3c/func/Kconfig
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config I3C_TARGET_FUNC_TTY
> > +	tristate "I3C target tty driver"
> > +	depends on I3C_TARGET
> > +	help
> > +	  I3C Target TTY Function Driver.
> > +
> > +	  General TTY over I3C target controller function drivers.
> > diff --git a/drivers/i3c/func/Makefile b/drivers/i3c/func/Makefile
> > new file mode 100644
> > index 0000000000000..16b3b9301496b
> > --- /dev/null
> > +++ b/drivers/i3c/func/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +obj-$(CONFIG_I3C_TARGET_FUNC_TTY)              +=3D tty.o
> > diff --git a/drivers/i3c/func/tty.c b/drivers/i3c/func/tty.c
> > new file mode 100644
> > index 0000000000000..50673bfb6a003
> > --- /dev/null
> > +++ b/drivers/i3c/func/tty.c
> > @@ -0,0 +1,474 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2023 NXP
> > + * Author: Frank Li <Frank.Li@nxp.com>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/i3c/target.h>
> > +#include <linux/serial_core.h>
> > +#include <linux/slab.h>
> > +#include <linux/tty_flip.h>
> > +
> > +static DEFINE_IDR(i3c_tty_minors);
> > +
> > +static struct tty_driver *i3c_tty_driver;
> > +
> > +#define I3C_TTY_MINORS		8
> > +
> > +#define I3C_TX_NOEMPTY		BIT(0)
> > +#define I3C_TTY_TRANS_SIZE	16
> > +#define I3C_TTY_IBI_TX		BIT(0)
> =

> This is #include <linux/bits.h>
> =

> ...which will include <vdso/bits.h> that contains the actual definition.
> =

> #include <bitfield.h> is for FIELD_GET/PREP(), etc.
> =

> > +struct ttyi3c_port {
> > +	struct tty_port port;
> > +	int minor;
> > +	struct i3c_target_func *i3cdev;
> > +	struct completion txcomplete;
> > +	spinlock_t xlock;
> > +	void *buffer;
> > +	struct work_struct work;
> =

> This file seems to also lack some includes. Please go through your =

> #include in the series and add those you use.

Do you have tools to check?  It is easy to missed some header files.

Frank

> =

> -- =

>  i.
> =


-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
