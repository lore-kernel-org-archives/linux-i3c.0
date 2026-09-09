Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FD4C79F8C
	for <linux-i3c@archiver.kernel.org>; Wed,  9 Sep 2026 05:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXZSB0ytmsmc6jXc/Ip9ARM/gaw929th25I61N54ywo=; b=DIMb7v2CAh8271
	Mj2PlKi9W7FZS2NenjAAKbyNrmtk/ruAK5jR0Vlr32EYaehAJGyWNktWkoQQcH6nG3yqhbMUxCPqH
	etjwXuZwiVFWXYONzD4AbIxh8wIqILgGoeajYCv/ehGMLO+ZCPvW66nmSR+xklwdRKNEEmrV9uUVl
	6oU+ZtmyZYINZbO26OYVzkYDuSLmVXf0TT4QsAbzZaIC3M9wwczmZMmvviO4+kOdMb6bcnmdnHm49
	fHmHei5eVlyriOUgTYbNhswaPbjlnPUXYROBZhf+UZtmREkkqPX90x3hNnGuI5y5M2BGZxfbZrKH5
	lqhr2hrBc8s17D0FNZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Awb-0000000Ane7-3E42;
	Wed, 09 Sep 2026 05:34:01 +0000
Received: from mail-japaneastazon11022089.outbound.protection.outlook.com ([52.101.126.89] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AwY-0000000AncS-4A8n;
	Wed, 09 Sep 2026 05:34:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb245slhRaXbuG5XgxfoWQ7xMUSsZQmWmMX3O/Chu6/t3j/Myxa2/uWmNPxAvK4R5TAGNyQ4xFkPDq1XL7fgU3prr+WLZn8ebS2Elow/e9II2LwQ6WRo0SoUtQUNygZaEK9kT57P3wUhrZpdeXc/6HBSJbe5s1To38sn2JuYLfVIVZ5HGkFd4O/G37qEJfSQoVlG9oW162ixwfbr7KXHg7h3XqaVkQZG7065kOatqgTbf7JxtStcGP29gVD7q1sPv4ZDxgiBnS7mdj+1k7qBM/CohJVOHt82QDlTlJzWoSRpBmIKqhlRlLC8S4IZwcLEBTedna6cXlTsc0TZKAAVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmXUshcSAPWCHNFeuKN5VT32WbbKAccXyzAuGzO7zRQ=;
 b=GpdNYZokyus3G9+/vtypbLkICKLlMHi5cULh5Pwk/35UiTzP/ZUoIFzzKfRAaLkm+tvsaeWSq9Vus94TAZCB4c0ecvGz4uqA1BtysCbfaPtMX7YXbwKCNfjK4E3+qW8tALCP6PnDPLHJwc4zbRE8yUhP08/ZnxFMZzA2GDkbac8VR+JkpRGMKXa0cu1l9FQ7xANo0AMm/rjZ8AC0XJw+DHQpgNSLm++9uGf8FFFiAxuxst+G0J6my5itwQZOXnA+obDIoioW5rYaqtekSY1luKcpykiDqz66//3CNDq9iGQJmufu1YURUbFFZj7Z4o0azSziUEu89VtfnboFQDqyPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmXUshcSAPWCHNFeuKN5VT32WbbKAccXyzAuGzO7zRQ=;
 b=BDhk/Zt03vJtTQrYHcNFvbrzGjUF+8/RBRn6l4Uud1Q/Clzxx8sgHmwWep0U5/xhUB9HkjB5yw82Q+6OCx3ke+W9GonutINML+LBYvcfFSD6n1kpcXP7AA13swfjGkA2z10pvusovwVgirsWIdILYqeEmGcWB5W4V1sv790B0FZoK1eNuM7Hp5hnBz9dz5EKW9G0nlhTjrY7y9Q2dj42PITo5wfr0+4OYINUmhuKN8tjcLcXyhwTaVEBzHJXipuOVzLmwqJc6XtJO13SxDa+VBXVDd3B9O6mk2SrELRHSYH4S7ok/iWem0twsXZPhdYWa4ziCmbGmcFRhaY1VGxW/A==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB7268.apcprd06.prod.outlook.com (2603:1096:990:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:33:35 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 05:33:34 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?big5?B?pl7C0DogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IGkzYzogRG9jdW1lbnQgdGhl?=
 =?big5?Q?_AST2700_I3C_controller?=
Thread-Topic: [PATCH 1/8] dt-bindings: i3c: Document the AST2700 I3C
 controller
Thread-Index: AQHdOgYGnk2AFkBmnEiGGqUqF4qN8ba6MFyAgAuTjww=
Date: Wed, 9 Sep 2026 05:33:34 +0000
Message-ID: <OSQPR06MB7252E8C6F9D3FF0DFB318B848BB02@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-1-19909e7cbd7e@aspeedtech.com>
 <apc4Xxv5F9jwAHxC@lizhi-Precision-Tower-5810>
In-Reply-To: <apc4Xxv5F9jwAHxC@lizhi-Precision-Tower-5810>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB7268:EE_
x-ms-office365-filtering-correlation-id: 09b2c89d-29c8-4f20-9977-08df0e33e45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|38070700021|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: Db7CJ8tEwI054qCbSXVU/p9oZcFjqW82EzeKcCF8nRveRXi1kVJ42z0cl4wWeqSLgGZdnbGXIN3Kwyt3eU6089BPj0E1y8DFpBTWZtkOf84crrdBFCs4tWqEyG0wOsTWbsLLVJvM7hSocwq1kU3e3gcVDuSvAOR5c7B579ZkXnbkFSnHbPh8UBllCaZC9Lt8pQ9B3Q6ZUSBQOi1ubwL4eNNAAdoWVDguS/3nYGUDSlA8FsSB1sipbBPtQ8fwYyEj19jFtjIZ9Qq+FbweSAHv8Hg/o279cr3sGIECqbC7I4o7ZdnnUL3wwCsjCau3sU4z/neA7QXcokRW7zfZef/S/doO1/Shm3pZfs56LSex037K6OLcdUzoRKJrmAt5HhefUBumsdqVksLxhkkGRipHkDbdhmk8KQCrEorZzOzxOD5YgKlcdeyvDkl8ettfAOZfPK6FOXejy6wTHnrTo+9PfJaaRSetxZ3MfNM2ph3fEoDQ6GDcMk1H/dyjO6v3VPbgXtJphf+42HC4QOEpg2F+4JbS9RfPWjskGrAyN1SjmFpFBtw3TQacz5jzFZozcTX4r51a8PGzdog8QUkXmlJ7+v7J1H8VmWiEU9TNst/IyufwoVtvQAvvZe2Nk7w6B59GjM6L4/M78DAHz0FaNj26JLwX4OhI+Rdqg1PayK7BOICQeW29ZW1LPEQm8a8SjH111KYp6aMZyx8xMsvIyM8LUsNYMW1o/tBcwEuU9QX58ro=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?WTFiTUhZVC9zNzRlWGwzUzBwOUpYMHArTEhjaFEySXByVnQzMmtrRHl5UjlJWkZT?=
 =?big5?B?S3MweENDelVSbmlON1pnVkxLRmhwWEh4WGw5S21sSER1dEFzUERzelRyVFRYbXU0?=
 =?big5?B?YndUQUhnbjNpUks0dkZiTUlqNm9Tc04vQmJjd2ticzVBMEUvM2dpSVBZM0xPU1JD?=
 =?big5?B?SHNtVm5SNU13dEI5MlZZdnpBY0psU2pMNmV4R1lnQzRlUUxiWkk1MDNHN3pqNHhI?=
 =?big5?B?OUo3YWIwT0xKemlWSDgrY20yVEREcEdsZFAremE1UW85WG02UzBWT2JvU3BWaGsv?=
 =?big5?B?eG0vc3NIMDhsOFBZM1BTTGFGRDh4cnZYSy81NVlsVWROZlYvNDEwWGpQNkNCMHdZ?=
 =?big5?B?b29YSkFhZU05cmNqVVBnOGdrQ2NRM01mdEhPb2k1SHpncEs0TW1hZGtMcG5iMXNE?=
 =?big5?B?VFljN0ZFdHBVNkhNQmdnTHhMeVVwQVNGeWhHcm1PNUxLUklQZkpMckJQb0JaSWJP?=
 =?big5?B?Zll6eTM5cDR4YURyZnpUb1pPSk5Ib3dwZ05vZC9ZMm85em90a0I2enZ1TFdZNE5B?=
 =?big5?B?dllFUzY3V2ZNb3ZaNkNKQjZOM1Yzdm1odmZKTnlrTFVZYjNvd0x6Vll3SnZ6UFc0?=
 =?big5?B?Tm9RRlZKbzE4RGxXS0xTa01SVTBZZ0oxZXpHbnhjZWgrUGFTbUYvdEFQV2paZkNW?=
 =?big5?B?NFhoUGNnakFFbUQyd1QrazVqeFdqYjdxYW1xeTB3cDEyUDFKcStFKzk5bTZoR255?=
 =?big5?B?SzlXcDdUbWhieW01TTZXOFVDUFQ4Um1nQWdjU1BpZEFEQTZsanI5YkNjalJoNlRz?=
 =?big5?B?VWU1UnRXbU5tdXZRWXUycldzREw5WkEyaDRPNU9SK1BjRGRWT2U1SDBNdHgzZitJ?=
 =?big5?B?NEtrOEdUT016RUc4ajM3T3dHUFpRRGFZblRJOTE3eFB6L2hudVFZWFpvaERBeVJk?=
 =?big5?B?ck45d01CUTJwenZFK1l6TnRRWEI3cVcreTBUbnRMcEsxMHlaY0REd012TmwzaThp?=
 =?big5?B?T0lGcjA1VkpBNlRicDlZVkV4eFhOdnRGWDFra0ZxaVVlNkNXdGp3djV5bHpadHNk?=
 =?big5?B?WW1WMzVQa2hZTnVwNGJlbWc5R3ljRXBWbFpzK3RsejNjd2pOQWxWd0lsaHdRM1Bk?=
 =?big5?B?WkZwVW9ScHlpc1BQY0RYYUVpSjZ1NDNNN3ppVVhUTmJIbEVGTVY5K1BoU0NhNUpn?=
 =?big5?B?WDZmV21EOGxmUXcxaGFZY0JENWxLM2V6cjN2eGJHM1JLUkdDU1YvbThQZHN6SUk3?=
 =?big5?B?bEZ0MkJYeE1WeGROVWxxdFlNQlIxby9oWkxmcm5WQkg5SFZtZGRPa1lqU2RGOWN4?=
 =?big5?B?b3h1NE83SE9hSEdTNzZwTEtqY0d5UWN0RGwvZXJUQ1Z6UHdXUTVFNklic3ZpYWxk?=
 =?big5?B?bWVKdStndGxiSmJzM1NzSjBHcTVMOWFqb256blRBY2p6QTdrdXpMcnUwcWYvTTg4?=
 =?big5?B?NllQc0tScnpQcXBKSkNJODRWazdZQ0Z0b1FNTkpOaFpJejcvS1h4ZjNnYXYyTm1n?=
 =?big5?B?ZGU2ckUvMWlWSjVZaklObHhsQmRxQVdRVUViemRKZFkyZEhQZEpiV1ZveVEzZEUy?=
 =?big5?B?SThPSHQ3WU12TWJxbUZHZktNNU96Ulo1U1R4d1ZiS2NLbTU1OCtEeW9sNHdjTUdw?=
 =?big5?B?NUxWcCt4ZmhnWm9pN3Z3V2R1SjhGZ0RuV3Z1NXQwTDV0NVhaT0FmT1R0azNreDU0?=
 =?big5?B?eUxIZUJvMTJNOUFOVDFTQW1IY2ZQS202bVE0R0luekYya3ZDYmZjcld2Qkd6NzVH?=
 =?big5?B?d2ZFSFNYc21tdGZsV3BBNk9kczlyQ1hUYTllOFUyNi8veER6bitTNlRoMGw5VjdK?=
 =?big5?B?K1N1b2VDT2lYdE14UmE1WEFnQkhjeWgydDI3QXUzNlEyZW94VGt1SEVINXp5Qkky?=
 =?big5?B?N1NyNWZkQXRUMjB6TDRWNE9vbytmR3N6QmE0N0tlZkNyanlDbTc5M2NuN0hiV0d5?=
 =?big5?B?dHNZQXFHTE9IK0I0MUpnaUlKcjRVRlNNdHBOQUx6ODQvOXM4OHljdnF0M0JQN2Fn?=
 =?big5?B?NkpzUjh5UmtuWklFd3k4QkFNcVFsd29vWjhPN0hqdHRZNWlES2hMSkFydEl3WnRn?=
 =?big5?B?dXIwc1YzNzQzUklXNGdCdzhGSytIV05OMkZ6N2cwa2t2eGI1UFd4Q3BHa2hJT0tH?=
 =?big5?B?SmhhZ2NnZkpWSWhrRHg5ZkdzcEFmR0ZGT1Zzb1RZYzE5VXRqY0d6dS9Dd0l4R0Nj?=
 =?big5?B?WkRLOHNZSXIvRFVnZHBJbVBmWXRhOEsvUmNLZmZMT2kraTJjQ3JGdjdQU2RxbW1u?=
 =?big5?B?d1VxYmh4MHorQ05TTHVsblA3NFFlQT09?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b2c89d-29c8-4f20-9977-08df0e33e45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 05:33:34.6853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPaRpDfglVLeTjO4267fDlyfDJzZkGHcj+UyCkI1MiWhlPc+lhxkhDRUM90lTgQV1mre6R/+YyBi516hLF2BrXE8f027HOEThjhslod9dT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_223359_046311_A0169E9E 
X-CRM114-Status: GOOD (  13.78  )
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

> > +  bias-pull-up:
> > +    $ref: /schemas/pinctrl/pincfg-node.yaml#/properties/bias-pull-up
> > +    enum: [177, 231, 261, 317, 400, 470, 550, 600, 750]
> > +    description:
> > +      Enable the PHY-internal pull-ups on SCL and SDA and select their
> > +      strength, in Ohms. High-voltage pins support 400, 470 or 600 Ohms,
> > +      and low-voltage pins support 177, 231, 261, 317, 400, 550 or 750
> > +      Ohms. When absent the internal pull-ups stay disabled and the bus
> > +      relies on external pull-ups.

> this one should go through pinctrl.

The only pinctrl capability of the device is to bias the pins via the PHY registers,
so describing the device as a pin controller feels excessive by comparison to allowing
a single property that already has an appropriate definition.

I'd prefer to keep this approach, but I'm open to reconsidering if there is a reason
this control needs to be exposed using the usual pinctrl bindings.

> > +  aspeed,pp-scl-high-ns:
> > +    description:
> > +      Push-pull SCL high period. Overrides the value derived from the
> > +      i3c-scl-hz bus rate.
[...]
> > +  aspeed,sr-p-scl-low-ns:
> > +    default: 40
> > +    description:
> > +      SCL low period used while preparing a repeated START or STOP
> > +      condition, kept separate from the push-pull SCL low period to
> > +      satisfy the MIPI I3C clock stalling requirements.

> these value is i3c stardard defined value, why need put into dt-binding.

The defaults are derived from i3c-scl-hz per the protocol formulas, but
board-level trace length, pull-up strength and capacitive loading can
require different high/low ratios, hold times and START/STOP setup
periods than what those formulas produce for a given board. These
properties only override the derived default when a specific board
needs it; anything left unset keeps the spec-derived value.

Billy
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
