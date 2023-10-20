Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85822C001DF
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ir6uyVAFJqyjcvAFZeuSsfXYN/3N4j9s7J6LDdi0yX8=; b=WYW8j29zOQStI/
	a+jK6EspSXCTnMQY4vuV19pvoYLqdyA6NvSMV2VtWJWI3R8T4lOzZHk7XRFj07y3vlf8nBt/gBLmc
	O4bYhwGBVqGAig0jWIwoqm4XkVoU0CaaeTdRKB03Gpoi5qUVs6hYWYE/xI/KnE7Leu4jJdCiUk8Lj
	4r9ye7QpO57AdVzByBiBQIrgf3vKK759KxQNzpeRS6+aWav53eKOpVD5WSYXMN72XMMKbrXKVMXO9
	+ZVdFfHO6trNp4cRGA5VexdX1RNvX7zcEShqZBqSF3s1yLkptf3WYWtRGi9Fu0MnzCfU79FT3c3JW
	yQxmCW6wz5rm10wajyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqND-002Tf2-0Z;
	Fri, 20 Oct 2023 14:21:11 +0000
Received: from mail-am6eur05on20627.outbound.protection.outlook.com ([2a01:111:f400:7e1b::627] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqNA-002Teh-18
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 14:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWLNbzFs1+wGN+QThyRPJr3fUSroZqjyK0w5ODsoL7NKegceC/D3bj038LtWD/6bL9CFEemiibrUIb3G6SNhx2dlSmYQkblOZ3LpnUHXOqJnJbxXUE295AwF49OIS/2g+U5Wp6B9jxVG60WKeesJlK9iWuAv1ucK5D9xOz/mf6D7USgc+1Z+ZjcLWsVP8yBrg4Nzt8tFVZqGZQ8w0TKcArwhpMlKbMz8JdrZF8evGkCEXn5W8p2HmgnLIe8MA9VTavDMhgBF0ptpecgzlF39vfZfCkqNpXNvxL95u8NltA5ILNJHodpBXd5PdH04mu2Ex7cK+NMQ9gX19rhznMteqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGTavYzMU6lqaWzOCOaheL+FHdUYizenARmC4f/D4L4=;
 b=D0S9MCImstWO2SqdWj1GB539TYNuQfWxD1IDVjL9h0drVYkR2ymc/RBh64Q4BN/gqh6pPuMqWBY28l4Ls14UDGkqNK7Y7TdA8cH9Y3hO8lbf4OpFEouY8jAr5WGda3SvhZtEAP6OZszhgS00RXHxCkB1FJylx9Sh5GOyaIQ3KGm3XaQRLKe5v4g3EYmJmqu1Nb0TVbla04WiY5lmwNpTZhlUTMb+0E3KIfBvb9QBGcOwd9K1tLvUZRBd4BISCnfP6U7t2qriuMFk8hEcEn1aK4CjpDR/z1lAPVM5OVNJjFINW9DEg3MX7Npl2mFYKhtcXCNgVDBtRmM/h1QVAFs2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGTavYzMU6lqaWzOCOaheL+FHdUYizenARmC4f/D4L4=;
 b=PY0nPHZN9CZjIMzV9LApSy42UqXFzeCnNJnr2w+TQreRTBvJsZ3UNzNvQnhgn1e9J/aqUxXqJgVOGHuM924E+31kU8odTZs//LM8Yd/PL37a4/nCuMUXAcCR2uUH7obGiFm1OFUWLLRzSse+YAN/DJBL4a8WuAUEluVBgvRXLTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7619.eurprd04.prod.outlook.com (2603:10a6:20b:284::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Fri, 20 Oct
 2023 14:21:04 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 14:21:04 +0000
Date: Fri, 20 Oct 2023 10:20:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>,
	alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <ZTKMyW939rB6sSKq@lizhi-Precision-Tower-5810>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
 <20231018205929.3435110-2-Frank.Li@nxp.com>
 <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
 <20231020154528.2f5f68f5@xps-13>
Content-Disposition: inline
In-Reply-To: <20231020154528.2f5f68f5@xps-13>
X-ClientProxiedBy: SJ0PR13CA0095.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::10) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 0559ed9d-6a96-42c0-c349-08dbd177cadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKcyV3OHakdnnZ4Onj8347Lp7U70JX8YVRrXSsLfCYw8ZgKhhMx+l8x41VniouD4h7djvi23aYa2jl39j4NbXtPz0gZF1XEz4K0dAY8k0MZIgSfg2a2cHQBK14fOeZ3PQRDC9N5t0yFtEHZfV009uXWKQTmQ7O0AbeM1A6U1fNynSK80WAkdRHF7kTTTvtfn3VV6/03FtRVBftUahbJ3UV3bqWr/xU4kSg4REy1Q1K6HA1eeYZUXWv3W+mecEofXn/BIzFnUvsVWCyLQCzUyvbnDcgNH4IHEjytxVhx9ojtOWqsFwzFtGC/Wd/CgnPI940Kb6ovvvLof/82Ke5Sv4AiNy/qg689dBL1NZbJMlL2fq1IiZ2r7YUNZGqDiCau8B1AsShjLMWCJR6iTFb35oQmvw8FK+SdifzwlPl6aVlXXQkvUKLTSVXinf12lNa0ezB0JJiVYlUeR3IwKl37UJL2MjxwhhtVFxc2xvQFAFPWNB9XQAndEEtcSHLM5pOsIiUuA4DLLofmYbJ3Hen5+WUKd3Ku+c0gAPH5uQokal3bl3NQJHn0Yxeq0VLWmP9tBx3DEWWY+jXtWKdj8Ab9ZZmwAKjMWQPRYf+fIrD+99UkWgFYgn0rE2fYP61HMOlN4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6916009)(38350700005)(2906002)(6486002)(5660300002)(8936002)(8676002)(6666004)(4326008)(41300700001)(38100700002)(66556008)(26005)(86362001)(66946007)(33716001)(316002)(478600001)(6506007)(9686003)(53546011)(52116002)(66476007)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yVkOVRHy+/2Sum8oGpcgkYuortQ7JaCXegiwtbdVKb/A1ZK3WET/yFvQDr?=
 =?iso-8859-1?Q?EiHLb1SiHKIdc71YfeEJtCpyXfc6980Wc6aQ9rZZzCKKkN057tM4NDYIQM?=
 =?iso-8859-1?Q?68RRc2X+9MWizTtglV/+Wc61F23/9r0v30tgtGEeeWIMihM5gq4lgqoSPI?=
 =?iso-8859-1?Q?oetmiCVrn+ewJQZrmAj2WOGiIlWcnRGcWHO5Co3NTaQf4sZLOeNyMoEFWz?=
 =?iso-8859-1?Q?bwD4clhFASjMnPDE6yMTv4ubDQRziH5QCinAS/br8AkNej21TK97ixeEzw?=
 =?iso-8859-1?Q?RNyPtoN56y1fKvMilSACkXUbSzhrxVN5BV8W9L+ouO5aDYjrPaTQ/oTD5I?=
 =?iso-8859-1?Q?LA7kI3S+kWNgSRiXPRoBoG6/bMYwUl2t8Bex11pwMuu9qSeTaqEIHMjo0N?=
 =?iso-8859-1?Q?WUTF/MA9wH5UPM/DXdf4nSrzGPctIfWOcJTa1b/qEbD1Cw82w6w4V9xU84?=
 =?iso-8859-1?Q?7Klq0LukrYk1bqxV0n9n40dNE8uTd62lRhG1HDEv5TFA2Rr/dltzhrrZk+?=
 =?iso-8859-1?Q?AX3qF616AX0KkUvqt1aVHSlAIySdx4y1OlJv5jkge9t7GqGH3tB50NoxUm?=
 =?iso-8859-1?Q?oJBPaO1KOwwXD+Y/EzZcCqb9Dq1M/3MU9/l1eDY1sB01dZR+u+WBMVN7hU?=
 =?iso-8859-1?Q?7KD/6UCYZkVmjoDbMS1SpoVkUR6NQY389iqwHhC2Mx3HaKMB9gD0WpjBFJ?=
 =?iso-8859-1?Q?2AMsA8LAfAXMFpL+BAK7EdRTUWhCk0P2CPos9KgtBi9VV24byXclnx9oMZ?=
 =?iso-8859-1?Q?KahRe+T8h5CJnSClARbr1MileBf5uUGiw1i1mHfG+2AF1sKlJnW8ldy950?=
 =?iso-8859-1?Q?I4WPR3FE96Oisy1hzBgUcDHXutFaDlMBedihy/lTBJ04/m/GMxuNI8WsU+?=
 =?iso-8859-1?Q?QKWRrLR+1M14HRFxAdUGTSyA4NIjoKYydAF3kiHCTKbLO6VFZ33QFwEX7+?=
 =?iso-8859-1?Q?r8yfCKT4geR9eWTUrEx7yQXCBTFgETBOmDM2ri4fvhxvKH6ZbS0DxK2m41?=
 =?iso-8859-1?Q?qrRYhGHqM1ppAMTplHg4c2eRkjmcymGP0KUON3kLHW8qw0mKwji3ct5KcM?=
 =?iso-8859-1?Q?HUJ1Twow1SYGMoiyg6Ldf0+KeNte6PhG4vWolBseXELloa4Kx0Ax4zCcMj?=
 =?iso-8859-1?Q?t2xD6eBic1RHnhwRlYEPFT+rI00twzMuTYEmVLoH8shY/SIRLHkYpx/qcZ?=
 =?iso-8859-1?Q?Pn4W8mTbJgX7zDdP62Sc3adyfxUjRIefb375SJzaBnmzlcJz0KPFyuDB8P?=
 =?iso-8859-1?Q?+a2zkASlIxppN6yG3aceDxNRipgs/hVAd1Fs3qd6v4t4pZX/RMXp6vHUzK?=
 =?iso-8859-1?Q?XgFba87BtaOZSP9JlD91b2dKNJ0UlB6JrenGfIPReh2+nRBsIUO8HiekcO?=
 =?iso-8859-1?Q?v9VW6WsMAutvGoPKq+fHenjEU2kj6k4s+JA+A2hrARX4bOQMpL67ri0oxS?=
 =?iso-8859-1?Q?UyBFqUPlCmr6RQRyX4gbNjlOpzlQvgnW7buWI+CcQtMFWFe6nPDc8RGU7U?=
 =?iso-8859-1?Q?Z9nfYAjS6I8y6IGSGO4LECZy+T74oB7J34VQY1XIcRmevwbw2AIFQ9r+Hn?=
 =?iso-8859-1?Q?l3tvWW+Ml+w4I/1NbP69o/OjQw/o8jmvhsBywdLwr2PYnW/nTc8oXh45Ts?=
 =?iso-8859-1?Q?bMyv1GDnPYf4i+ee6Pb4Pyos0Ndiz+Hesx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0559ed9d-6a96-42c0-c349-08dbd177cadc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 14:21:04.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SCxUJzzXPYp/5XfN8ZbUDgFlTuTZ4Sl9iJOUFnKrAJ2TEtvWDWPmtp0LALt7yu5mgpTwDRWBAn7hdgTW8OGsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_072108_411766_91B2786F 
X-CRM114-Status: GOOD (  17.74  )
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

On Fri, Oct 20, 2023 at 03:45:28PM +0200, Miquel Raynal wrote:
> Hi Lukwinski,
> =

> zbigniew.lukwinski@linux.intel.com wrote on Fri, 20 Oct 2023 10:55:27
> +0200:
> =

> > On 10/18/2023 10:59 PM, Frank Li wrote:
> > > Add hotjoin entry in sys file system allow user enable/disable hotjoin
> > > feature.
> > >
> > > Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
> > > Add api i3c_master_enable(disable)_hotjoin();  =

> > =

> > What is the use case for having HJ enable knob in sysfs available for u=
ser space other than for debug stuff? In other words, does user space reall=
y need to enable/disable HJ in runtime for other reason but debug? If it is=
 only for debug maybe it=A0 could be move to debugFS?
> =

> I don't think hotjoin should be considered as a debug feature. The
> problem here is the power consumption which is higher if you enable
> this feature (you need to keep everything clocked and ready to handle
> an IBI) whereas if your design is "fixed" (more like an I2C bus) you
> may save power by disabling this feature.
> =

> A module parameter does not fit here because it's a per-bus
> configuration.

I agree. sys entry is more flexiable. and let controller choose better
power saving policy for difference user case.

Frank

> =

> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
