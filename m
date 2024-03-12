Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A33C54E58
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Mar 2024 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/IYpJzCcDECTjlc7fzVUTqrTD7ReLbzMD20cjUx7LWU=; b=LHL1Y3mhTdqu2t
	9DQQtsqGK2p7Mm4qVoXcewb7FkktDOldT1dgFUPbHvDPHWlQd3Q4ENvxMbXCvJYCirma4TJKNK7QD
	HLMj9CJGA5h6Ep48cnVjBI7PgZpAwcC9YF1G/AG8N87CdxjN6tsrnJgeDHXTHFJQ9nrbYirzDA8ES
	4SQ91dsAfH1NvLZpCh/QYxpaDQi4/ZHmzLR/RlPVnuyJWq9QcTndFezw5IjxS512xOIlBPbEKO9jl
	tczqkCztVtepmG+NKOf1oay75nuvOoJKDrIfa/ftdDHR62Udarjk19T3U9L9LtuchBlx/1K2qLCIm
	GW27gyqT0d/NOuEDlPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0MB-00000005XVA-0AVK;
	Tue, 12 Mar 2024 11:31:43 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0M6-00000005XTi-1d3x
	for linux-i3c@lists.infradead.org;
	Tue, 12 Mar 2024 11:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fob9l1zlfZlufzfs1L6jQtt2xm3CuSlcW49monqXu5g8xoePBSyVDcI1zLjIsStYhsX81Jw7IU9gGkit1KYJ/4HQiWpmI3lmIuESPdomgDZ9L+gp6sjTgO2Lf11JcKW19IzqOJCfTavnyYSTJO/o59G6uWzDI4Sd3Lsk1aqXVZisJc03iZCBDtaWq88f0vV8MSKH4ZgXYIuhTbMofVqTetK7TQSjCCekI4soRow159n3ltNcVy84bQxpLpe58V/Sv7XU4koK1E+fFY6rBmeMbYZeH/3YDdP+ZagMeD6ycOIcIvAhvgQBTp6llIvkiKz8HCWgN23hQBKCmw78EUU3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7sfS+PltoFfw1Hlm7fpVJp5THRqQerDaT9pfQT443E=;
 b=itWHIapKtNxtMguYHlGiReK6Xk17cho2h88zmeiwJ0otm8oRHzI+d1o7wSvaLp7k0l3a4534lzsAvZoJSifuSlIiQ82fyH1G15RYofO9kjSgUHsFQ8cxHnnagjJYhaZcmQclxD3YO0M8RwHf+zr7Bg5S7xrDFdeih94hxQ3eHWL5DLg7RrmkItzZVVSu23f+nRZrUjE/sHnb1sUxwVDkKjPkrFI+Nk7HxZGoW0IpXtGxQxVBc9EnAPgQ+9t/Q20abvL1B3jBJSYWkBSAwYzTMQuQILUkqU3bFGGGJWg2J6YpV3GiEvsVMZKU87Wcgg204wEUSB7onbWoBnFEeUlHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7sfS+PltoFfw1Hlm7fpVJp5THRqQerDaT9pfQT443E=;
 b=nAvhck7yK/cKGRryownyTkxchjsQcTvbucByp1sXMdhBHAfC9cBniANPAoTzXfFU2Y07ZfEBocAJ8Efb3wKEHgxhKudz2vB8xmcD3/ftbr66mmXktAnNTtrd0d/xqOo6j3mO2MfDnDCsBoclHtMJGZP8nCvBkGW5yuhebsdWl30=
Received: from OSAPR01MB4323.jpnprd01.prod.outlook.com (2603:1096:604:37::10)
 by TYWPR01MB10885.jpnprd01.prod.outlook.com (2603:1096:400:2a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 11:31:31 +0000
Received: from OSAPR01MB4323.jpnprd01.prod.outlook.com
 ([fe80::6c55:4f31:d3a4:52ca]) by OSAPR01MB4323.jpnprd01.prod.outlook.com
 ([fe80::6c55:4f31:d3a4:52ca%7]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 11:30:30 +0000
From: Steven Niu <steven.niu.uj@renesas.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, Steven
 Niu <steven.niu.uj@renesas.com>
Subject: How to add I3C device node for devices with random PID[31:0]
Thread-Topic: How to add I3C device node for devices with random PID[31:0]
Thread-Index: Adp0X5vKTDj+4c4eSROo+B66I1g8Ag==
Date: Tue, 12 Mar 2024 11:30:30 +0000
Message-ID: <OSAPR01MB4323733A7B1678DE5B8C3027BA2B2@OSAPR01MB4323.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB4323:EE_|TYWPR01MB10885:EE_
x-ms-office365-filtering-correlation-id: 4678d3d1-746b-4026-2962-08dc4287d2d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1zMmdgCtDPo/PUyuJ124pCqa33qvmN6hFJ9l2W7jijAJ2R4RUO1G8lYMXGArsyTnp16nMQZtUgTKC+VCV/brmfGzp01amZVbawUBrOHp9xd++4dRTS9DaeWnaRHZoW2gsyOB3SVofM1RQa1MozXS87/PLZsk8bySwpy0sq+Ai71XOEr4K6RjzrPPf3cugNHb3+8LWrUWx3ns1tfP7TTtfQfZneKq3xBW4K8hLIfWoIuO0oyLpMzgE97xqv2nic2nYQqCRCF0TsRT5J74otWz73uX9bQhPGx07DaHeLRTN7jKIMSup6Y3NJkILC3WIzfl8jX8eSn7cHS3OjIqqhmsj/ofYQN4S7XZXPpcyyHrZ/a2AHmuenCznJAvme0OPnvsjcP6IuiiugWz1FogZub8EaWRAGRjTMz6haYo9MYQfhJP44cbjfOgSOHSUQTKN71sB0RRYobAfGQ42D7kfxSxWh9qqT1+ru5NevMAlC1fY/4RUL6zVRXdRWFssT8VRnZjJ9Ixf7eAkM9q8t7fnRgl1TsDVeA86ERjJBUiqANzxAjG10yC4bVf1kM6T4PB4w3cCYFS+nO7iEd6FSrlPk80ovhWENzhJGh+F2wM3fp46Ve+q6vk5cZaCZI/RS/p05GoTLWRrEwyEL4/Z7pzLycxFyKuqhKgII6CX2s6DMz8XVQvbzSHkzTPkFQjpnmEt5ggm88bJ6/kg6NZkwri37mC0A44zU3b++Hvxm4C/Iuvo2M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB4323.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yVlovkaKC2Wrkb5hIpG1UtK2zzO0h3NWLINVAkdbv9HrL2FKh6oUKPQW6tUZ?=
 =?us-ascii?Q?5DQmge+CWFh38Es1ZYzK9C/i0e6fuKO4EV5ewggZczzyQ8Tp4ntvcO8bqZUd?=
 =?us-ascii?Q?5qQlnUgU0gHxKrlr6+M0N/lYnEa7FAFTGIyzjSnbKmdfxXL0VpDKssrf+zGk?=
 =?us-ascii?Q?pEvTT6Qv46ibJ988Jndpg2+3FKIBVLi/f0BmaWzVZJu7HnC7ZEvL80yhJbD/?=
 =?us-ascii?Q?ibH8y3bobenWRXHdzb9ogk5WxAb1LAk0+X4uR29Ql0QR/3CR3Z+48xWMRVnn?=
 =?us-ascii?Q?5arh9Lv/N/hRQ1ubY2ZrV9M7iC88a/YCYGCwlZ6QQAmSTgsuNUXGaQPcgjtB?=
 =?us-ascii?Q?QCG9i4/e0WCsYR3W3FI1r7QOCqBR7BvLdvbvbo28AdFNlqV3tlvo3zbFXkwt?=
 =?us-ascii?Q?0yVNFqV7DNQpu1I2XBpaNX0IF0HKWUBoPYLnrvo4d7YYBVT+d2OKMdz2bjW/?=
 =?us-ascii?Q?sLxk4dawPH3TbE5KQD+76cqAzb8mZeAmDn2JmDCNTDEkE2H1eKQNDXbsKENk?=
 =?us-ascii?Q?8J5ayeESOSPaQK8uidJjIvjREa3AFAKOcpr4v9uEezUMJST6TMOmF3zPAkz9?=
 =?us-ascii?Q?ZCit2DYl6Fq1SypttUjdMUktT+V8GUopQa2dWKoGEQRKt4loLHX15tq6GpoS?=
 =?us-ascii?Q?Kt3945HrcdTqKutTctoTuLUi/MNyNH9djN7gFbZmhxivgHnK4LbD6moXugtQ?=
 =?us-ascii?Q?8p2qp05Xh5YeLVjdyfn7AWpxaTKe1xi3unNhK5sT4nqQDQRl+K3IA7RQdns8?=
 =?us-ascii?Q?ioxvKBqPSPmRcmZYiujSZ/dS70M0DXCBEK1qYKQwuxMD2Bza3LGkM4+jmKi6?=
 =?us-ascii?Q?E0tJAHuyz9hy2HVonh+NVaJDU+O7o1NrIr1nA80YzWwv8gwI3oVy5SdU9d/q?=
 =?us-ascii?Q?MUaVSyJKNBlwXAOo9hUkIAL93jZQF8BR7rb3CD/6P8Ach0IMUiD4frkBkjN7?=
 =?us-ascii?Q?9XC7R8swfY08UPhD3w4czywb7e61o5hypjqtSsFCSfOq0JKymrD4hVhFCJeM?=
 =?us-ascii?Q?EeJKbivVUMBrI8uJbLtsoiCxJRg4rbgeGS9mpslysMy2z5x7yd1Dh8uffnDa?=
 =?us-ascii?Q?oaZ6AwRAocKZmOCQsMMhJdXTpSJXf3dT3dHoj32S4fw770yDN+702knzZ+YV?=
 =?us-ascii?Q?tiMRbBnCY8pAMdpWENJceiU2MLAk1q9KGAxFRt+w5JmwxlIkLlTzw1mwExbO?=
 =?us-ascii?Q?QDxzB5nGHwiYsyjlIT+LCDJcyEHXVw1cUQs1uCDv9jyZLwUzEzPPFtIzvzyC?=
 =?us-ascii?Q?HJwmsJYC4oFscoLUB1QlzpRVOV5hdVz6rh5CQ4TN5f9PtTvt3sh0iuT8RXwO?=
 =?us-ascii?Q?B6EFf1Vy5uiwma5t1LnSeA2zUGIlQNoZZsyCx4O10we1mU1M0A3krkNfz3p6?=
 =?us-ascii?Q?d6KJlX0r2H8XkI777wWt4IrtoLL1SNwDsU2Z66XudoPq2bOyrwJxhPknh666?=
 =?us-ascii?Q?V0IdeZ9cuJnf9CQkZwGyThH4dtk501IgUi0hmoDiwkiIrWKlZfgWQor/jUZE?=
 =?us-ascii?Q?VcDW/akEIz2rCF/b84i2McZMecW4cgb7GvujVJ/ry0X/wuMzCjjGZI7OitqP?=
 =?us-ascii?Q?VMdpKcsvFiNCxEJymhhAc6yGiLrDgDsN4cVyb3e1?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4323.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4678d3d1-746b-4026-2962-08dc4287d2d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 11:30:30.4601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+McSfCwQWvMjhPYaB5Gz6qSIAiK5C/THXG3dEp17tYoP3CMYH5HeJoh9p5nA8b5fVj3UzkQwFcSZUCiSdsiUHSH9Uhbc3aBGB25tEDxFno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10885
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_043138_714815_D2A2700A 
X-CRM114-Status: UNSURE (   5.25  )
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

Hi, Alexandre,

There is a class if I3C device with random value in PID[31:0] and these devices
are identified with PID[32]=1.

In function of_i3c_master_add_i3c_boardinfo(), the node for i3c device with
random PID is denied to be added to baordinfo with code below:

>  if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
>         I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
>  return -EINVAL;

According i3c.yaml, an I3C device is allowed to attach extra resources by
adding node in devicetree. I have some questions:
1. Why the I3C devices with random PID are excluded here?
2. How to attach extra resources to such kind of devices?
3. Could 'I3C_PID_RND_LOWER_32BITS(boardinfo->pid)' be removed to allow adding
   the node of i3c devices with random PID to i3c boardinfo list?

Thank you.


Regards,
Steven

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
