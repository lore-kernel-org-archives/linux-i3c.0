Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8614C28B25
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxom+s7jrQa9c2Jcz+Cj11edK/HmbB28YDV2LDffsG4=; b=qhrvAtUOkiO2Ri
	uxbfO+XXPu/7et9BMH+HkKdMS/WJsSwOOjy/sDZ0QqVYJ3IolblC5/TFgVwm1GGMOwiDg0zR3EcfZ
	ASr2+7tmNpJE67apTg0bhDk8bwlqtqqni5zIUv0+2hVRZyV4rMUJnnnMklHurMnjYCBw71ndCDHyo
	GrQLHEPlAGfY5OV9K2cvtEazKBxYTAa+yYhOz1WxumrGmIqLLCQe5NAQkq4YsmFUiP9ZRwM3gfRuN
	clxYcrExce6AJy15h5nF+Mq9BohujU+zLrUaDBdtpVsqql0L9+/OkJGnp8wkJcbpMNE16DUA0EpR9
	fA6kReDsah7cN8Dltkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIKW-0000000CC8g-2x52;
	Thu, 06 Mar 2025 21:00:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6dr-0000000ALWt-0H4P
	for linux-i3c@bombadil.infradead.org;
	Thu, 06 Mar 2025 08:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ICdzJVbm12SB/Vjy50EdLS1SU+U4bh0eUYyel6MW+fY=; b=IWszs3rGuKNXM/idFcawU7+PZV
	4A21/gFn8nVn7C4Sit9+xiY/1LOpMkAF6g6eczpU+EeEQ3oO5X025O2cH/c+SPtP8SYRc0T8jnDRy
	FQQ20FgV1c4OR43WibOaL0/4Q/UHTcIEKRZPh6Twn+B5cTWJM9pEkUSGVECnKv7zZXtwGTBUEIKnQ
	bX1vSU8JTjxPjlG32Yni70iofFBVQMIeuDhqMBDtGEfyk1eZ1zWeYDe9qxeXljiqo9HhAtOtl0pSu
	KK0d96PD6kYkmqA+IoGYKurQkUW++t72+t925PdggLQvRzeJApdOMyb6jBjoqXxS+7quESxwDY8a8
	peyXCB8g==;
Received: from mail-vi1eur03on20608.outbound.protection.outlook.com ([2a01:111:f403:260c::608] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6dn-000000075Cb-42wU
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 08:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leIB4PUozYo9MT4qO2ozDabM+7ywTYJzls8Z8O88lW7DGoZrKzqmlQKONTqfjaILH5+Y53hHwsCP/5Cru4Cb7IZnffDVg57KulaY45JCl6Hir2wnXOVgJ1zk9Y7p+CoXzWVLBAl9wdeHY5CO0R92f7o72VU+SJD1hX6eW1uXjVdDYqDy9KfAlYk8yvJHhaDcD2WS9GiC0zw+TWn0+oyPtOZOjU3HjgotpFpTPi3CrFkKYESu+5VkL7Y5UuivgbNOFcUdLzqf90rGfiS1KiH/ajIqQiEThzbkiMsIGDTd8PyDiGKitaeEi42iF7KK4+3odSjdL6lSX+r2yNzbh0v3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICdzJVbm12SB/Vjy50EdLS1SU+U4bh0eUYyel6MW+fY=;
 b=cSX4Q+XDUMnWxF2uo0KqHGn1KGlkVrsFtK0kzTi/VXm+XJHYqEFeau/aBd112YvgiUW7qyIZebHYoIwVzg5957HfcQmFaFUKUp/K6qAAuzjJucNDsZooGFM1McYTrdH+YzZO/JOy8NIozm336tH4Lf3lQXOQBRJMqiCp6XLFrYT50F/hu6rDu95rWm1wDhKaQlfUtOy5UlJ0rvlaX9s8r9yCz4cZhcFkTV9FgoU2dUaAjXMlzq0Vkw/RPsuhgqkeMffaP58Hj3lDPEskzKwhjFadIZ9MSBsPDPSfFlE9Xv+Apnvr1SGoF/QNqiWMq59UzkQrEsWurTTy4RfsHliEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICdzJVbm12SB/Vjy50EdLS1SU+U4bh0eUYyel6MW+fY=;
 b=eHuE7YL4/P/px85VD9nV4YqlVrPggucs5FAxOOKJZ6EJWJHUByO3FnQc6NoyfwRBQ0+sQo0hmfaIYw45dM0AkAJhWFWhqVtQ3p1GzIEoAMU+kxzBLqTtuAQWy+IHhI4g/nmyt0Awc+B2ZnNDIVuDLlZJSwPE83UDEdPttxtQL2r0SrFba3teijOcOs1ptdtqFBD50HidtL5meR4EsnFtIqGlXRi4H891VKjao7OA4vZcrzbbZG5Dh2AuFGfVP6Czh49/oTbEK2AeBLMqA1Dw9inlhysAAEsO5Cd7ns51fn9kk/VzdHOZ5Ylrx9sorGddUlsIR/G/9lt/itJwzTrtcg==
Received: from VI1PR04MB10049.eurprd04.prod.outlook.com
 (2603:10a6:800:1db::17) by PAXPR04MB9154.eurprd04.prod.outlook.com
 (2603:10a6:102:22d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:31:29 +0000
Received: from VI1PR04MB10049.eurprd04.prod.outlook.com
 ([fe80::d09c:4c82:e871:17ee]) by VI1PR04MB10049.eurprd04.prod.outlook.com
 ([fe80::d09c:4c82:e871:17ee%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:31:29 +0000
From: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rvmanjumce@gmail.com" <rvmanjumce@gmail.com>
Subject: RE: [PATCH] driver: svc-i3c-master: Kernel panic issue fixed
Thread-Topic: [PATCH] driver: svc-i3c-master: Kernel panic issue fixed
Thread-Index: AQHbhmrgLz9oTBo3ckmGrUVlGQqbF7Nc48qAgAjnVUA=
Date: Thu, 6 Mar 2025 08:31:29 +0000
Message-ID: <VI1PR04MB100498A9CFBB48DF250CC73B98FCA2@VI1PR04MB10049.eurprd04.prod.outlook.com>
References: <20250224031754.1001101-1-manjunatha.venkatesh@nxp.com>
 <Z8Ha+T9Vc8Bhz25A@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8Ha+T9Vc8Bhz25A@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB10049:EE_|PAXPR04MB9154:EE_
x-ms-office365-filtering-correlation-id: 1bb55a8c-5abe-4760-bb3f-08dd5c894ac2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?QXwbSuxPEl98Wqd9NKgVRr8ybV4hEm9JLn8GwaMc+TWB6ht5mgQNLZvzm/Sf?=
 =?us-ascii?Q?QrNOlzTuX/UDfYoDb6fsKJBjyc3eo9kPSMMyL76UladB7Xuc8WonhZnr9AtP?=
 =?us-ascii?Q?u18wQgN5yjo/o3rKhtTdvZSpELZ13aj1aVqXG6wqWt4wdAOarz502LJorqZi?=
 =?us-ascii?Q?SQHeECsO7db6xDXb1/t9yHZYLkruntYDBXlF3TYBGDamQ4ilbEO24d97MMY8?=
 =?us-ascii?Q?YcEow8h8NMnGUdEFoeP0/pclIFJfnBsTvnnrtbrXrbf0I1uQQsG7lo6cC3ks?=
 =?us-ascii?Q?ctvFqdZEFfToI7/cmzqkvpE/YVl/kn4gOT4WJQcEWo2WZsnauptkoay3tzFO?=
 =?us-ascii?Q?hJHsJ6JmXikAv1IFl1ZoWGd0DJb/GUF+UHJjejoHWbOWCUCQft7GUaeopoWl?=
 =?us-ascii?Q?mRWMXMCCMxWODdbykQhJil86UQ4QKVf71I67xjQpsmhtUJoRR9OJBEipWJCx?=
 =?us-ascii?Q?WqsXsp81kKErPx04ZJlH/ZloJc8pj+ND6nooi7kieXcYoHangWl6ABDbosWh?=
 =?us-ascii?Q?zug9uONBViLliKe1VlquhD0w0djpdpgRwkgJyyBL0XRO1CtktszhUxv7p+ZJ?=
 =?us-ascii?Q?xyh2m4kijlHIvAhVapV8qr5vpsP7E1LxTvs3pvTBJwrwlC2pYQeExuJlSS5C?=
 =?us-ascii?Q?YvksuvTguLGl22ja7lI3MVb13PeqJmdhxH7e4GBc+OEhCm4QtQHo/8QoMqZI?=
 =?us-ascii?Q?14ZYLtG0hKrzHzbIL02LzRgQznrovrW/66mrkQZUzl84dvN+Gz5H7Mw7HfmH?=
 =?us-ascii?Q?zzd/g1JKW4V5ny/OsqsgS7/KWh7K1WF7HjmLUZB8EkiCG45szbxXHBwQ6AHN?=
 =?us-ascii?Q?hfg3029H9lE8siMhjIlHYQymBrwq+YqOKmk9TaN+H+kTWehRQNy6a8iZGi00?=
 =?us-ascii?Q?rgt3r1WZr3HEb8F+7+6dsln/zoBxG1oaRp61P8Ysj88NP+KYjfUx32CENQie?=
 =?us-ascii?Q?dlFHtDV6PPtqyx7lDXSUMefEsnZRAz2K48IDwJN8evwyg7N3P/VXxclBAlqG?=
 =?us-ascii?Q?yEzBy1KWp+Pfx/QetnOq1QHWcE/HS/uXkX58Uq5Xucb2tWMUSshw2hDCUxUz?=
 =?us-ascii?Q?IC7TiSZ3XfhT9ILkcp4R4GRuz7Quazjt+kmuD7pXjVYZGSfgl9hs9X6dVYQw?=
 =?us-ascii?Q?yV4hYSv+GBGNqgzjMp+gtu2J9kMRhWoKAjJEjzTa1n6JTeNB4Qq27vPGi+Z3?=
 =?us-ascii?Q?bB8sE8smmROLCgniWDql7iILlTacfx/wFzWNMokQ2Y1zdZczUl/W+X3ZJ73O?=
 =?us-ascii?Q?5BIJwheV4wnuojWqBY3vEhL3q2BSY8uMliO0AaIBXrhw8lEovb+lx/cgG29+?=
 =?us-ascii?Q?dCW53ZqKXDaFd1Ze9+eJfwTpsyM7qBHTYCz6UWUGN9c8fCrcqUagWZQSwFZM?=
 =?us-ascii?Q?leEl5ppdOMwEF7R2tvmwtOROHrhk6/pY87pif9LkZA1z302HrA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB10049.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7aCHiS0VgHaUISMI+AHITj9TsZZwEbYvq9WvZBTPO4nQ7kFya1rXQe3I59v3?=
 =?us-ascii?Q?odSen/ZRwIaCWqPKuYLJFrnPBd8Ldga7/GDnTuANdmvlkBWQEsu2Msygmsvf?=
 =?us-ascii?Q?h2o5U1pUPsnb12CPi3+25hPgkAnuVlNXruBCX4PP6X0mfvpb9yT3BPiLKl8Y?=
 =?us-ascii?Q?ZNsbi9H3hr0JhfBtnJH+UYQRVRhdglRr1oJpdPAaVmE37+eAJ8DKYaBU3W6j?=
 =?us-ascii?Q?mgsOUyFh9ATSoNi4V6k4wDkrxAjW+avY3HQKzWwUITazV6bmavEgfLyIkUCK?=
 =?us-ascii?Q?I5hEU2lqseBJEoSrZDtoWtqr/Qh5ozVTqDdu8JgtMEHns0optoLpw7vwL0aV?=
 =?us-ascii?Q?VMgd6XACHdI4Kj5Uk307m9PrOk1bn4KHpo2EqpU10TIbWOrHr7L9qfgA01lf?=
 =?us-ascii?Q?4jSZ3MrI+QdERnfOkGmC5iIVOSvxHpPh42rOplQNZcF/FEiVx0FmVuMMF2ID?=
 =?us-ascii?Q?wuqjRTwYQiAO/2QXHNcQOF0L0s8zJuP6tNsH/fcjA5Iv4pfIspz735Db2iwP?=
 =?us-ascii?Q?RcB8Ho5dAgiL/oHws3obSD46k90k+zkIsQx+JqesZxCUqN9fgETtekXe1PtZ?=
 =?us-ascii?Q?gHRyTzGyzPrfb3puIemaYWqk9DwikDM1cjj2SNJbCYIlivAaFu2TVofdN97Q?=
 =?us-ascii?Q?gHtFlSy5FRcLeuGKbHA/3kst98NRj76my2t8tkhQGp5A0HX3LJ5pyvZbemq+?=
 =?us-ascii?Q?OfXAR2TposP6oh5dJbtOMBwiAsGNXoTrhA7JEI3TFiJZ+ENNKBMMlS2OtTqI?=
 =?us-ascii?Q?AEtEVPnttAH75d/ZQLXkZsNpj+PalnRtAt/XJWXB4497iz6qgeA0af1cNJf7?=
 =?us-ascii?Q?FPvhBnrGbHrWnmttBGGWsvbg1mDEQZP0lfDO3bJk/oLy8Ero8B7j/Dp15uSr?=
 =?us-ascii?Q?0c6FVm0cO++rinfcwAjPQrsyWoZh5anpEn1jfDbbdLx3mbxc8ceYhv820pgN?=
 =?us-ascii?Q?bH+ej9FUUX3pEHTKVzOhyWlkWT2Qzn9GYzsH/u3PYRUJ93clBzC9/xKu/9Xr?=
 =?us-ascii?Q?tvbGymKMwzM6Q6PQ6iMIARWaA27dA3RpWJGg7wtiuxiTkwJBu5v/vpI7M05Z?=
 =?us-ascii?Q?COGvcT07XBDwfhuO4PLN0IPaaIZVTrnWFAIlRXg5YAnED5Qb7KaO2txycifr?=
 =?us-ascii?Q?OahdJsOWG0uqCRIdMEZIHBgLLOCp+vnegPxnYJDoBzSv52clylWZn05jXYwP?=
 =?us-ascii?Q?KpdQda22tDU1GUiutRNb7DErAF0dNWa9lD3KByQnTEb3D5wB6WlJJjfqnaIh?=
 =?us-ascii?Q?kjludysvj3yWz2gU6t6Z+13wvzWALthxRO740JXbFs8ayA3LCDfUjUrR0/3S?=
 =?us-ascii?Q?qXd6EbNSiZxopFdl8iYO3U5G6Ut5X0AEu9QkIludg2Tf9SrekyBYQC7R2FTG?=
 =?us-ascii?Q?/590kwU6fR+3yvG5D078ETUhRrI6jjaXunI+p1lDThg1cHkGcBSk4LmPfKmt?=
 =?us-ascii?Q?8eDbVB2rsWhrL/ESVCLhaHbvcOZfPXWkQC1COQuD6HK7AllCkqwkInY7F8tD?=
 =?us-ascii?Q?4GtoBUemvmv7T9YyMmM/2+Rh24Pd91/56LgcyWFa7YEiuJmeLcNd94gZWH8D?=
 =?us-ascii?Q?TQJRCjKobw5DUAzRsjpT8BSTBR+EOylWyeKTZE+2DliPcuJq9nqmZLSDtL7o?=
 =?us-ascii?Q?zg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB10049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb55a8c-5abe-4760-bb3f-08dd5c894ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 08:31:29.0683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cnrzc3BmPPatkd8mCFqqvZ3wlpsCsz8emf38GPm1pLYwkFmP4N0+bzD3hCFXm5As0zeAurPmD2zahWFy2SK7oiUCtbIknQ65YAgP6Jm4w+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_083140_048909_F9526425 
X-CRM114-Status: GOOD (  23.87  )
X-Mailman-Approved-At: Thu, 06 Mar 2025 12:56:28 -0800
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

Please find my inline comments.

Regards,
Manju

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Friday, February 28, 2025 9:19 PM
> To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
> Cc: miquel.raynal@bootlin.com; conor.culhane@silvaco.com;
> alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-
> kernel@vger.kernel.org; rvmanjumce@gmail.com
> Subject: Re: [PATCH] driver: svc-i3c-master: Kernel panic issue fixed
> 
> Subject should be "Fix read from unreadable memory at
> svc_i3c_master_ibi_work()"
> Or like below pattern:
> 	Do ... to fix ...
> 
[Manjunatha Venkatesh] Tittle updated as per the review comment.
> On Mon, Feb 24, 2025 at 08:47:54AM +0530, Manjunatha Venkatesh wrote:
> > I3C Master driver svc-i3c-master
> 
> Needn't this line.
> 
[Manjunatha Venkatesh] Removed this line and submitted the new patch
> >
> > As part of I3C driver probing sequence for particular device instance,
> > While adding to queue it is trying to access ibi variable of dev which
> > is not yet initialized causing "Unable to handle kernel read from
> > unreadable memory" resulting in kernel panic.
> 
> Can you provide more detail information why/how this happen? which
> varible read cause this problem?
> 
[Manjunatha Venkatesh] : Below is the sequence where this issue happened.
1. During boot up sequence IBI is received at host  from the slave device before requesting for IBI, Usually will request IBI by calling i3c_device_request_ibi() during probe of slave driver.
2. Since master code trying to access IBI Variable for the particular device instance before actually it initialized by slave driver, due to this randomly accessing the address and causing kernel panic.
3. i3c_device_request_ibi() function invoked by the slave driver where dev->ibi = ibi; assigned as part of function call i3c_dev_request_ibi_locked().
4. But when IBI request sent by slave device, master code  trying to access this variable before its initialized due to this race condition situation kernel panic happened.


> Need fix tags and cc stable.
> 
[Manjunatha Venkatesh] : fix tags and cc stable updated in the commit message.
                                               
> Frank
> >
> > Signed-off-by: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c
> > b/drivers/i3c/master/svc-i3c-master.c
> > index d6057d8c7dec..98c4d2e5cd8d 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -534,8 +534,11 @@ static void svc_i3c_master_ibi_work(struct
> work_struct *work)
> >  	switch (ibitype) {
> >  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
> >  		if (dev) {
> > -			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> > -			master->ibi.tbq_slot = NULL;
> > +			data = i3c_dev_get_master_data(dev);
> > +			if (master->ibi.slots[data->ibi]) {
> > +				i3c_master_queue_ibi(dev, master-
> >ibi.tbq_slot);
> > +				master->ibi.tbq_slot = NULL;
> > +			}
> >  		}
> >  		svc_i3c_master_emit_stop(master);
> >  		break;
> > --
> > 2.46.1
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
