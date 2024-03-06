Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C22EC54E41
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Mar 2024 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjJeO2JxJ++ozll0jhFEqKrYvoCFHcRHloRWRX6C1ts=; b=mv3HaCw0way2Vw
	gbPZuQrOtbDi8IAC45IEWeQNlhcCCbcy9ZwmXaNgP2kNhu+yZ1p0D3UY2vyMPNdd6wu0lwO2gNigZ
	hK+ebMgDi+pvng+MKJaMkwI5xzzpYZa85hYQWEoJl/9gjfz80Gu5fbB10DtZ/dEbjM/YyLOj6gbDQ
	WLudP+vMjOcHxppQHbLB5t0WlWXJCciirf+4TloWsczkLKz9EHLnp2QiUeEgPUfS4KRbcccCPfIlb
	8DFeyPuewIrR1a4DtdmALx9IigfaxYGp6sa5tRYyHY9HM7WCgw2bXuT5UUYJis59j+3AGunyFlOeV
	+3xDkJt90BhU7DEJ/+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtxb-00000000xqZ-2sty;
	Wed, 06 Mar 2024 16:17:39 +0000
Received: from mail-sh0chn02on20727.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::727] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtxY-00000000xpb-0gwF
	for linux-i3c@lists.infradead.org;
	Wed, 06 Mar 2024 16:17:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBrxq3991/7xKJidC0W0Tzxc7opVjWLEUa+chJW+tDNvl4xJG9Z5fUOKqzPfIaDmso3m8/qQnt6UMI87HZgfhO3wKyDcJKC4Bj0Ub+uu9ZsiV3BRIZw4aEIKHl+4PwzVtU3DhYq5znwIVluQlEdzoyuBmmXcMh4h1Y/bz15m0sjBX7azjLCfLBrStem1TfE+BghcZfmqsfQkMm+LIf5+jUQrSafeQqTV3PVrMp/dDgX2QQsoIuvwBpJs0hlK6pm5j+fhTj1G3ZPmfyWpl0+1oRBjgd5+8MzfnwoDhqEOJ/3Mfdd4JNKOcyUEjmCJwN+15esiHJHhzzjHc23ph8IfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfdv3AoU0LUfMpoQxN5RD2zAvb6XJFlnInq3BjyyWnE=;
 b=e6tvEa6FI0CRneLwSkDZMDh0GF3Js9xnO6H7VF88Wf67m1YK3mSxHiQoRVNRk0DkaUTfJAT3kfJ0fXdjQWZH6qRZMgQWsxJkHbgmVLrWr9KwtFl8MJdjx1O4CR7Oq/eOCM0V0lV5RiwlmrTut2cuM4mvaIRz/lC+bFbIFO0iJQeckGMt4EzvPsqc5DmvJmp3MjN8jyIvwBmj+jyrSEUJ5FK2PB7VAd07oY+ghEObfFJqUd5vE7baneEldXPO6OSeHjwBFgj3bOQNKqNXHb71XyWepw/k50dxbjC+Gl7a9UALLmqu3BFVyUJ+4kzkfD3hZEdJfmHoaQsiS+1MGIj4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0571.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.53; Wed, 6 Mar
 2024 16:01:17 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::f6ed:1a18:3fbf:788]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::f6ed:1a18:3fbf:788%6]) with mapi id 15.20.7316.050; Wed, 6 Mar 2024
 16:01:17 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Frank Li <Frank.Li@nxp.com>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "jirislaby@kernel.org"
	<jirislaby@kernel.org>, "joe@perches.com" <joe@perches.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "robh@kernel.org"
	<robh@kernel.org>, "zbigniew.lukwinski@linux.intel.com"
	<zbigniew.lukwinski@linux.intel.com>
Subject: RE: [PATCH v7 5/8] i3c: target: add svc target controller support
Thread-Topic: [PATCH v7 5/8] i3c: target: add svc target controller support
Thread-Index: AQHaWIvaQw3YyHT02UKJrOMhyC7OnbErDKXQ
Date: Wed, 6 Mar 2024 16:01:17 +0000
Message-ID: <SH0PR01MB08410A70ABB956DF9DD4DE25F921A@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20240205233326.552576-1-Frank.Li@nxp.com>
 <20240205233326.552576-6-Frank.Li@nxp.com>
In-Reply-To: <20240205233326.552576-6-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0571:EE_
x-ms-office365-filtering-correlation-id: 3006193a-a604-486a-d8dc-08dc3df6a822
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w5jH6AvrA5s6Xg2PxzM3MmJC8M1b5nh1HIPp1c9sFBuPW0/pOWsNneBQAnSE5hzHqy/ESpEvZr9t2AAZPNmnbs0zZpqMneQeO6XcidFSP4V4W5U2uKH/Fu7mFbugNm+QXUCgE6LCXVw9BsEEd7W4Valn9HJ4WR/G08RwI8f3eICfJ1JxpuyCAAsA9W+p+D88CyHujkv30/zgQuUY1k8QuWWMttISbIwGe4eFxoR2Mg99aCY0KQjbP92gtjIWN+61/EVFYyZuMpOa5erUXJV8g9ZQ4FLA7Uiscxc5mNwhRG7UT2P3YRkQ/AYcvwhj4ohPJIN6HWCUyBBpCcXKKwMCucSSbIjyoahoSKSdN8L8seQni9I6cuweLf2Ih0QArcHeNXABYGfM36aXH5GPq5bVrdF9zR9nY8KXLRK8W+PMO/MkjSRcKDqP+uGWfv5khk0Us17sk+XPcYji5IFymXHyVCXEdV7YKZPSqGK4IRwCp6lxdcG01tYPRo/SnRzJdzIBJPQ+tF/F7YkCCHvD2Doi52KOTSfM2jMzy1z79x3mHGSKf3HesLRKiqHiEiVfwigE2QyvS25D0YClrp+ZxThILx9aRSvsqTOWkprvSNrp2z+xTaZKlFEo4NQ2MwGKVm2k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?axLzjIVgz7yHQx2rECoVNZrSJhyiSRw7B03ZCrJiNoS3AtPceWUAaR96n5Mn?=
 =?us-ascii?Q?UuB3v4cmulEhrzXHQZbF7kd23w7XS5ZjCZ6lMLpC/d00Z6RjnFsEJxUmZejb?=
 =?us-ascii?Q?8U65fw4B4bjtPQGTjEmERlCrpnjyBIWP1T16nWgJVHkg0cm4QZw4edDNAnKd?=
 =?us-ascii?Q?EG3RhB+g4EV0Pz5GaW0m539eZRdsyK+2qZeQDZ1knpp6TMOA1z3LYA7AjzlN?=
 =?us-ascii?Q?hElGNBNXhMWv6q1pSndtOmskSj3rP/4+Jq/hRu6rtjGD6X7xxPXmTVXB34R8?=
 =?us-ascii?Q?M5RIsIX86PgoZsBuoCJCcU9YD56P3TBuA4tOlelYB9rXSocZGIHTBd4lk75E?=
 =?us-ascii?Q?J+PqH/w4T8qyB/Z5n2ne+Tcoqr+vEPjOZnYg+XOPblxKkqUsm97rICJFFbKt?=
 =?us-ascii?Q?94z1LxaxxYoaLw6dUixTK9B0TvTTIpcrMPq1CgcoUfNF1fpe3mkEspzMfW+e?=
 =?us-ascii?Q?JF8uEHC3RkrI/K9t0s3qBTlgnaarofhfkbAqBhhAefj+7jkPnBYpfU/6q8fU?=
 =?us-ascii?Q?JTtQyI1RawKTn0iWwj3vd6jX0UcbvwCjXM0E1XHll9fh+oriQ6qfT45VXe3c?=
 =?us-ascii?Q?jXwpwcUkbhfpyHqe5Ly7qpO0s+XZasa5LDL/UhkkxUYsDUPeIuux48jx7oGT?=
 =?us-ascii?Q?ZdpxlnEnWY+6GpeF5WQaLvp5fz5VNJV1uFGtXYLML9N1tS4wC5G1phebiRtQ?=
 =?us-ascii?Q?5eLvZ6B5YCoj2/EXeFK77ydxPWUFhYKgtOO4IBQ60I0XczybfiSi/pbMqd9R?=
 =?us-ascii?Q?ufofTTWWsJuT087/De+uxhjPusLUqirhwozNS4zIG0NADXQ8IiPB9VZX0NWM?=
 =?us-ascii?Q?EIYkckxCUsIU1Wbxe/ompPOuxKQ6mLcvcFxbIePgY/6PatyieP2yd8CSbCEG?=
 =?us-ascii?Q?UzinWM2d8n4WF0EUjtUF6C3uW4ukclOlsr2WeWIKYj1rO52ifmnVu2xOFegE?=
 =?us-ascii?Q?YuXgoi+P/ldoPTo4LR8zluvQCm070D2Xyd/vBf872MHNBkgspJbvDsXJEOEz?=
 =?us-ascii?Q?apsWRqYfIKs0JEYKAvOjxPXPBX+nC+P947wpDF/4v4guTK70rJV0s5EmlvHu?=
 =?us-ascii?Q?0bniXhJrbMZHS096luab/lvNQmPoisjKq+2ZxITlKQT0tXN9WPQ1iZXi3rOr?=
 =?us-ascii?Q?e4jWKmKYir6yf9a1Phcc5PaVBJcEtktUjlSSDnISOmVXbwBLwmvwk8uhK6UO?=
 =?us-ascii?Q?5VolAqSCTF3EbWQ4xKQ+qm45gGUsNeqv3oH32S3X9oXFbVMuUEjrS0v/uVc6?=
 =?us-ascii?Q?CHhztsxaCupD7NCKsnJ/7UlYoGCRuCWa7D/eIhPtoa+p9alJoLjE/fLH9XDz?=
 =?us-ascii?Q?Mt77mHHaT4nn9+pXP/p3DL0VdNleNCdaYtfnHk74rZDbGMnagGOEjR3Byro3?=
 =?us-ascii?Q?uartzmY6B+zftqcyYGLSbN7nTNERxKjllwD+aqZWfhz3wBi5Qox6csXKB6UW?=
 =?us-ascii?Q?G6latGXNAB3gNIHTbUKnbV1vIQ1EfcIgGhHNwARx3YxKJW6cWsf7l2IiTWId?=
 =?us-ascii?Q?4R20qBqdSm56WS6tO+jNG09HKM0MWstpR8MNJyQhJpt5HcVDguIu07OpMSu7?=
 =?us-ascii?Q?GtnWn+UFFVBHGmzKJx5FakqvrdUsyJ0Gf3vP3IxB+rILzyjCUH/XqliCBrIf?=
 =?us-ascii?Q?mg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3006193a-a604-486a-d8dc-08dc3df6a822
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 16:01:17.1853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jaQX3N6ZatN2jQjb7BATAIVcmPLNhPCPV1hVfIPNQ/MwhPiH0PioyKCZ8ZqZuQ2FbjHwrt7y6DBsVG+jjdYDVFe3nCSucZ54S/i8BFYQaQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_081736_220251_A0DAE1D9 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

Hi Frank,

> -----Original Message-----
> From: linux-i3c <linux-i3c-bounces@lists.infradead.org> On Behalf Of Frank Li
> Sent: Tuesday, February 6, 2024 7:33 AM
> To: frank.li@nxp.com
> Cc: alexandre.belloni@bootlin.com; conor.culhane@silvaco.com;
> devicetree@vger.kernel.org; gregkh@linuxfoundation.org;
> ilpo.jarvinen@linux.intel.com; imx@lists.linux.dev; jirislaby@kernel.org;
> joe@perches.com; krzysztof.kozlowski+dt@linaro.org;
> krzysztof.kozlowski@linaro.org; linux-i3c@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-serial@vger.kernel.org;
> miquel.raynal@bootlin.com; robh@kernel.org;
> zbigniew.lukwinski@linux.intel.com
> Subject: [PATCH v7 5/8] i3c: target: add svc target controller support
> 
> Add Silvaco I3C target controller support
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - fix build warning
> 
>  drivers/i3c/master/Makefile         |   2 +-
>  drivers/i3c/master/svc-i3c-main.c   |  35 +-
>  drivers/i3c/master/svc-i3c-target.c | 776

I think putting target mode files under "master" might not make sense. We might have to
consider that we may have a "secondary master" mode. Some other ways of splitting
or handling of target mode is needed here.

...

> +
> +#define I3C_SCONFIG	0x4
> +#define   I3C_SCONFIG_SLVENA_MASK	BIT(0)
> +#define	  I3C_SCONFIG_OFFLINE_MASK	BIT(9)
> +#define   I3C_SCONFIG_SADDR_MASK	GENMASK(31, 25)
> +
> +#define I3C_SSTATUS	0x8
> +#define	  I3C_SSTATUS_STNOTSTOP_MASK	BIT(0)
> +#define	  I3C_SSTATUS_STOP_MASK		BIT(10)
> +#define	  I3C_SSTATUS_RX_PEND_MASK	BIT(11)
> +#define   I3C_SSTATUS_TXNOTFULL_MASK	BIT(12)
> +#define	  I3C_SSTATUS_DACHG_MASK	BIT(13)
> +#define	  I3C_SSTATUS_EVDET_MASK	GENMASK(21, 20)
> +#define	  I3C_SSTATUS_EVDET_ACKED	0x3
> +#define	  I3C_SSTATUS_IBIDIS_MASK	BIT(24)
> +#define	  I3C_SSTATUS_HJDIS_MASK	BIT(27)
> +

There is couple of space formatting here that requires to be fixed.

Cheers,
Joshua

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
