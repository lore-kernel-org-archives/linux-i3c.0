Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B5FD41178
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpzeSjrhbv1vL4Hb1BQ0UUIODutAll339pw+nXhKOCc=; b=I/BqjUSBrvY3RQ
	okfHL/Y6BNh/2UI4fsBJMiWw5C+b5uw2cIhGksgEdH+ZDMZWFuM6zkZ91HQKUPzXcH3q6UjISulzc
	DjU92TfuWd24tEMT7iCH/c/l/mcQil2/6r4MZnRjhHIBcoITSuc/8YfH9k8owr32P2NXGdsn5/F2e
	XCjqbBKuKHLmmWkM71hpygWthAn7T5/XJitIxdZ8miGDMElmu7B8PrEupG80DWG6KX4Zj7z36VB6m
	uC/It039Kw+NqFe5mILRb4rxOYU7H3W9x0DTjjgALR6GW1vwuBbvb3WlLRfsNtRFv4h/Jw/NQdmXI
	AM3Dwd9EuhClNhmEmSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMLo-0000000CK0H-3vlk;
	Thu, 15 Jan 2026 12:21:20 +0000
Received: from mail-norwayeastazon11013045.outbound.protection.outlook.com ([40.107.159.45] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMLm-0000000CJzg-1UTW
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 12:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX7tlzB5LibZfsKDfkiJYQ7RL2KvjcZTfkvnipvYeeDdpENWiYPJXRnCZA5juwbeDYTJi4m0CFFWU/Ts9J3MfCedMl0GLnBXIuTEDO9q+rmiLaCVQPNP38ErRgohVNB3QjBuHkM1rhW+YORRxgoQUL2ubJ4n8yDGU9EknDW8hjZ+CqYqrol5l5sWipzYe2vVyyvzkvOIh9PRgfGJhwtvqNL3earoVOa/gso3KJ7PNqrZf84KQ/A2uHCBVvQwUeYew1llEajRqu5lIRnRXGTL36cnU2VoN/tZDOF/bts51b4P8zmRGksqbGRV45xRXnTc9827yiERxIqS6zPfUlf4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z1yrPtYZ5Tcw0XfA7gtESYvQCy4ohTZ4Sr5lykU4Nk=;
 b=AEghybg1BnGlS4+ByM84ZQmAjIDjRGYJctlurEJ0SBFdvAqx8LPlRWGARCHXd7ax9Aca3JN62j7XSY/9Udilwf1WwCorHIUNRfwF8MVjZ+F92pOOU6LGoDY2y5Iv2M/d+/FUrEriUM5qiWCXUQXIT1gbyoVU1+BPdxr+EBj9r8KsS312OSLyXtnj0LCTEsDVNKWKxr1QCFgTIwxb2UOj8t/tgPFsGA+XS8AwlpkqPu/hYRpa90rPUJAq/wmscUAklu0bWEVcpG0suPXRXC0MDfUMSaoz8eUL3/ULq+ONiobnwqgGjX+1RFszDpBxH6Tax1hfdASmTgNNfXVmEPH8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z1yrPtYZ5Tcw0XfA7gtESYvQCy4ohTZ4Sr5lykU4Nk=;
 b=TM+nsjj7nOPn5Azou0MELr9uw7VknfuV06I1fc+OYP3VzhlSFC6tbOWhRofzo5pZfR399ByfXKueGUh3DKzhh19il+cuOuyrYRkZF3g5WqFYu1QbqmkoSg0oTbddJqklOfe4Ebl39L78FsoIRkK+8RZKlKW89EW+74J1hA93LmXLYgXo1jrW7xRTf+Hvv6hSPKlAjpJYs7MmqLehYa9LaiVbRZ+VFmBXPTzdovH1CGcny2mK4nNxAg28J1U4b6TQgjRRRtrMKQQFlTICpLdTmS3HqzOszF0McGWp4w4f0SuqVScbvJFDvbFHruSXFfMg8zQQkQ6EP1XuJnd8IM09IQ==
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 by GVXPR04MB10708.eurprd04.prod.outlook.com (2603:10a6:150:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 12:21:10 +0000
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::7798:43c4:2503:952e]) by GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::7798:43c4:2503:952e%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:21:10 +0000
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
Subject: RE: [EXT] Re: [PATCH v4 2/5] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v4 2/5] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHchIIr4+/JTisIwU6BjjRHAVgus7VRVRMAgAHPzoA=
Date: Thu, 15 Jan 2026 12:21:10 +0000
Message-ID: <GVXPR04MB97786A5E118F5D12A9BA591B998CA@GVXPR04MB9778.eurprd04.prod.outlook.com>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-2-aman.kumarpandey@nxp.com>
 <20260114-wonderful-vermilion-starfish-ad6ec9@quoll>
In-Reply-To: <20260114-wonderful-vermilion-starfish-ad6ec9@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR04MB9778:EE_|GVXPR04MB10708:EE_
x-ms-office365-filtering-correlation-id: 5a40f8a2-f576-409a-6d6a-08de54309157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?0jHaX7ufn5Ssq4iXHRr98GOW4fJ6cOsPzE3sOV9ictJUU7O5v9rVZ+NZu8d3?=
 =?us-ascii?Q?x/GSjkhhORyCR4k3my2SwefwOWbAsJYatbcws0Fa3Oh/ZOuGKdVbEy6k4Z3B?=
 =?us-ascii?Q?swQS+qYyrxTvH97v7HEs1voW/n5wWo33DlgMz1uOgMvqlaZD5y/vmZ5Alyz+?=
 =?us-ascii?Q?QNBXN6pW7RC8ohPmGT3onpyPEynPD3mC521P0ZK+aGNKHT9z6HlLszfh1Dtd?=
 =?us-ascii?Q?GBrnWw0bCbQnY347Lugj57F5k4nRM5CRrAelergWDdokLZsPwTLNUYNw4yLQ?=
 =?us-ascii?Q?VLyPrXKHlcFvRsGE6UTk65vsaTFd0P5H20+5UX5IfV+4xvLjijOze+UOddxo?=
 =?us-ascii?Q?0v/gf/jgIfIFBrjvMZvWDa90hP1ZZOaa+eJjp8hcFMHbz/64P1JpCPpUtXJl?=
 =?us-ascii?Q?1Pdk4MMfOiSTHrE/JAVwyeZLzJI2TMJrOKRPmOxBjy5fEHfBcUEZ/4SnzUOi?=
 =?us-ascii?Q?gdCfMt4y8fyLKK2jBVBWj7OwTPw7UMiF3Im8meEGA+cBt9J9NDUabdZOnrdW?=
 =?us-ascii?Q?PjC0fH5ttV7XDtyPaM8c0CPRwPYkqOfKMec5kbvU0Z9pACbqrbd3+7JVRYRj?=
 =?us-ascii?Q?5mz3nDPfVhV0mPNl0DHxJCZ34p/tP75I4WQDNIpIKsAFjX77O0cUynAV6ufE?=
 =?us-ascii?Q?wAldZ57q8RAzu0/CbyL4KkD5QugKSzbF/D4UxQNalFEGuIx0O9xh+o4XDPfD?=
 =?us-ascii?Q?+87rfxzwB6HVkSwNRv4mcRzpi/xjfBo09KiAQGNb/VFhbMiRQ2NVYYRDs/Gq?=
 =?us-ascii?Q?3wuE9aPy36unK4oHFE4jFPdf+r/oKb9yiJCzKTgeENMg0oR5b6vQ+TMP0IUE?=
 =?us-ascii?Q?Jwq0MGisqS8DebH6h1N9FS0disonuzjafpgDJRZFnQcPXkL5skLwvxj3mIeV?=
 =?us-ascii?Q?pnOcNxIhqMgo2pU9iGIZfSNkQSK++/iD1lItpUhT98fT2Za3zTYA642mnhVf?=
 =?us-ascii?Q?C9OrjkU+W25Msl1kulrKE/YBn5d8Zv4ydL1QHugBU2gMnP2ipw5QOdUU0C5y?=
 =?us-ascii?Q?nvjBCXmA2NBDn6BwZ89ZkTAyvGNyWMptDYnAjL0lAZ81qd+8bDN36QneI16p?=
 =?us-ascii?Q?om62+DhwdygD2TD82rj3+4Nh/+2L6bE7iB1Uy6NcMiYVPQ7bZLRxGLrcIy6U?=
 =?us-ascii?Q?YKUdiW+2L85s/FITc4a7NlI3STXGbQdxXTeqNU18vzhxFawrmJZx5NF4/Q23?=
 =?us-ascii?Q?FYT1Myc2b4XRRMq9cu3Q8X1msQ1HdlZ4vgQ6OiP9aKtXcAd4lqrrXKghu3dq?=
 =?us-ascii?Q?IQ7Wzjln0LSj7oTT6wd5os9MMCjz48+QuIBp7KBMwbNG0vhwFG3bracUd8P4?=
 =?us-ascii?Q?e8iGgXJBuiWJhgkRorurwhqvShtir3iIiiHc3FtJFgo1FxA5FYvc31CT9wZB?=
 =?us-ascii?Q?dUdY+B8qnjbzIZGM3XQxbydZIlUKFNkVVRCTxZPM65rvyofrtae1wyIiq69B?=
 =?us-ascii?Q?jfu/mecMKklmXZPpl9zDvjlwTbjsbTAzNnAUDAChdUcCWxiOUXZZVkxIB/Ck?=
 =?us-ascii?Q?45CWRkpAmfFQulwU3e7SipcbhD/C5bmRr/oBIY/nqm34gTiR4EkeQtLeaXtE?=
 =?us-ascii?Q?Tlok+TYYh1xazmVV3pB36Eh/D7zE9hliW6oY7Qe+dOO8JY5vxtC97AKZicj+?=
 =?us-ascii?Q?QlN89lkIRdf6eg15jN/dBlo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9778.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y8dfODMr7YKbeb0bv9+80Foc4qaAosX9ttO8BVVjzZ4fvx+6x8pp9YM4vFA8?=
 =?us-ascii?Q?XyHCP2odnd8PPVcY5bfZL1vg+3UEyRttdFbWxXIfWMVRUJf2Vj6Fic9v9zIt?=
 =?us-ascii?Q?jQzQgWrjbF4aYqfmS58IH+yQubnBKLBnPy4F5uwVORYhPxsotxxUp7C82NRN?=
 =?us-ascii?Q?tETVV7fukOmmq1FjhxWC1tzrif0ZEOEhqHCSyy+jVpvmvcrwd+EAbZjVSQo5?=
 =?us-ascii?Q?9nT74G6mDV4FA235cVMcZAlhM0TB2imkYbVoX+6T+wFwQiuTb320tq85Qwk6?=
 =?us-ascii?Q?9zUroL4Q/Vh65lYXjoW5PfxTuc79gknbTXWhvne16en02YaED9Y17X2CK1YV?=
 =?us-ascii?Q?NnQ1GJzoUSvBuUfXtIZehu3/dO7neaZ5sMVtK1RIScY2nkgTEy5M79JvLgNN?=
 =?us-ascii?Q?2YAb+1s0wYqpeTtOI/qZMLZ0KUxkobPPXndw7Id4tVbWIzH6z6faAvklwpOT?=
 =?us-ascii?Q?fS5t2HRQAOe3TCe7z1wmamcv37q1e2Q1RY75OmBM42fYA5xQGWI71s+OGPzX?=
 =?us-ascii?Q?qAz8OR+T+4MSqX57lERxXwouGS9Fg8H2spxwNEi0H5i0VxE5lxDJyLyq6WfW?=
 =?us-ascii?Q?FaLomjNGlEKkJBnZlTWHikvCSTAqWldZKGZMX1PuCFBx8og7WwJKlV5QdJG2?=
 =?us-ascii?Q?XUkie0JnhoF0IkT3Uu2uFchYMKm90wbgHw3o4fcC2dooer/7IsBpS4lAYdxL?=
 =?us-ascii?Q?Brk9z7n43m25TYaKmkbws578Jbbpv4w0vo8AJzJdkwGs/m+3/IIGzdJa00zI?=
 =?us-ascii?Q?XvzNqlJCxgyv/1TowDKMiVimKz5Qe+EINft16tfYXAVU6GmpfLjIhSSZaVuJ?=
 =?us-ascii?Q?rlZIL+qRofjfMwOUuzUAuwSdxgMHnRJ7UmP0G5DTnsxdJGbC/peGguk/SMuB?=
 =?us-ascii?Q?vR63qLRGhBMtwsekcMDOJaR6HnVPlx5QqJMdkdAfadwbexB3f8U51IdX0vN5?=
 =?us-ascii?Q?59hOBaIGYQtwCRdoAL6NpqBLLcUy58ovL5Tg3VjS2iJryieFbNmqckroG2WJ?=
 =?us-ascii?Q?9ER96ZRLM9Q2aJ1kDrPgfjY5Yx2pltYzskLmHlGDZG8S6/qBBgrsYPzAbHIh?=
 =?us-ascii?Q?7FRvPs1fc8ir53N7xwt4XmFHXm/9ssBowaeunBbluxqKl/aQ/espRfy5XoUO?=
 =?us-ascii?Q?sJnRfYYi3n3nEO0QkRTk53vsL8bknkbkJ+BHLRBDmIvndVLAwnqFhzRCLh0T?=
 =?us-ascii?Q?/CRCCEKwk1ebhmYq12XVD0cYSFXBnS8FZI6pK8OxGm9d1xeeaQfvMmLiFOIK?=
 =?us-ascii?Q?NdUjxdBBd1TdO70a8g8OvOR2O5Qt83ZYhLBVCKNihqLh7tkRKCScTSHX2RwL?=
 =?us-ascii?Q?VUIr1aqnfZtHAdSoOM6jiPXwOC7Ak2t3Y7iqY2hGAMuFBp0Pck3JtwpLQqlU?=
 =?us-ascii?Q?MgwFrAqAlx8frgzG9VK7G+kLnOQwKU921pvUTIxfyWFairnalfAZbvPHSYOb?=
 =?us-ascii?Q?c3Xj1hwdjWPNbzm4dLfxbW+sftYzjj8k4OLCZQcPc7oVLiytWaHRIRwu9Rbt?=
 =?us-ascii?Q?Gf2ln1XBZLtwVgO9MuPvwOyyb5ViBSd1ZkOuyb8GH4rTHIBufrV9yZe1UgxW?=
 =?us-ascii?Q?vNe6pz3vx+X5eA+ayo93vIH1+00zyGtXwd9rNRhHPSq33lseM+Oys4uL8aB2?=
 =?us-ascii?Q?QgXgebr8BV8EyyejhxJKG5QOjOOnGRKIgN59s0FyqIMMGlNH1FsSQIClrNrQ?=
 =?us-ascii?Q?M6+d/BjpXP5Dt3J0aOsY4fhRrS3HIwzjx2tCFu8yhlkIBnVEikypYNeDXFBM?=
 =?us-ascii?Q?2NpkRlrNHg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9778.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a40f8a2-f576-409a-6d6a-08de54309157
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 12:21:10.6221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sUxNxnTQhRNXqE3xUCKNVYt3j9D39Hhr1Xvb/ThVCNYV5ZWtleQUCg87iGuG5VIXHt4MIQfCvj8norK9lyESelDyS4+CLqSm6Ka44Tg5JDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10708
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_042118_400339_D25FA65B 
X-CRM114-Status: GOOD (  13.93  )
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


On Tue, Jan 13, 2026 at 01:45:26PM +0200, Aman Kumar Pandey wrote: 
> +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> > +cetree.org%2Fschemas%2Fmfd%2Fnxp%2Cp3h2840-i3c-
> hub.yaml%23&data=05%7C
> >
> +02%7Caman.kumarpandey%40nxp.com%7C75a7d6f1f8b74fd3ac5808de5346
> 3133%7C
> >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639039758104017624%7
> CUnkno
> >
> +wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM
> CIsIlAiOiJX
> >
> +aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Ze
> GSgy3cF
> > +whQbcO%2BserynVrrrqYGOIwBMgVjgdY25Lg%3D&reserved=0
> 
> This is not a MFD device. Place it in appropriate place, e.g. i2c or i3c
> controllers directory.
> 

Thanks for the review and the comment.

I would like to clarify why I modeled the P3H2840 as an MFD.
While the primary function of the chip is an I3C hub, this device also contains a programmable regulator which is exposed externally and can be used to power downstream devices on the board, not only the internal hub logic. This regulator has:
- Independent enable/disable control
- Independent voltage configuration

From the board and hardware point of view, this block is not only a "hub-internal" power control, but a board-level power resource that other devices depend on. 
hub logic and the regulator block have distinct roles and different Linux subsystems (I3C hub vs regulator framework), I modeled this as an MFD with two child devices.

> > +$schema:
> >
 
> > +  cp0-supply:
> > +    description: Phandle to voltage regulator providing power to controller
> port 0.
> 
> s/handle to voltage regulator providing power// because it is completely
> redundant. Just say port 0 power supply.
>

Ok.... I'll update the description to just:

cp0-supply:
  description: Controller port 0 power supply.
cp1-supply:
  description: Controller port 1 power supply.
tp0145-supply:
 description: Target port 0/1/24/5 power supply.
tp2367-supply:
 description: Target port 2/3/6/7 power supply.

> > +
> > +  cp1-supply:
> > +    description: Phandle to voltage regulator providing power to controller
> port 1.
> > +
> > +  tp0145-supply:
 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
