Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C85606A324
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Nov 2026 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcUvOpfV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mZkYx05t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m6iorZuJ/+Wm8cPdbjQBjKs43zSGor77UlVsic1Wi9Y=; b=zcUvOpfVn7XnOO0USn/h2u01le
	0/ww64aX//bIPzMyJo4wmiAd+NDs4dvlBUWmAw5GfqF+J/teQAJm/oNsZpHPOp2ZLPFJ74hFI3ZkY
	zumBqioLXTPj50nvnzMOg0RTWG4ylBrMR236flcu2TWNdt7UlWbik4Rzag6nhR8Qx9qpy/bm0Hcr2
	eN6K7nyPP0tnZfFzTfXqWLjZa96ruA8JCGeJoGW86LhSIL9f6Zi+Yl372GWOoP73tQqydx147Ukqk
	jq4dAqOWehU3Y2hVq8yBkx6RIbjuoD0sU7rSOdl8uzeqPatKMw1XZ4R+FxSu0XPbcQ5YEzK2qOwMR
	/q3/ovFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRC0h-00000007I81-1M3C;
	Wed, 11 Nov 2026 17:21:23 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRC0e-00000007I77-1VAA;
	Wed, 11 Nov 2026 17:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2zEJwOnCW403iD9v/gOg4+ADwoJdPnslg8hKah94UEMyNWlOVK8Ug/+L/o2L+f75coQoLx1Ia6wNe2VX00D9YmFmNOLz5ZIj4y1iSWMVEzTEZ8GMDgjKOkQAdtQSmTJAwcLrJskxbtgbl14CKVf3bNFiyvEAbFqN6OtxCE2bI9moZuwxkMPEsHAFt35JlD88m+vRMh7pBBfE7XRo62YiPJ5nhg6e615fzo/ZYxDh9yWIJ605n13T5FkEGFYTpHWo3xQvvB8lUI9M1wyM8/AzPPgciq+CWHpthdejO1Hn0g6//nTIUH3dkMJNDd7QxsX3kKRaYP2A1sEBHU4iNTXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSN1kP1CaB/8fsbefXa3LnME1K/Rku67T2K9S2tGPbU=;
 b=TT/nTzaDMhHCGKNbTPrrT5dJes5UmirpIvUwVtUCUr37GhJWKCqKEMydBy5L/hoMa+20dCtobIm5k1GcMkIEmbvpBX4f5M7msRH9Ke6VacchwW1Iu4rs+mCTAC/4zbB99jza/MAbmF8l1jm8mGv95XDt05XkLh3IOSvdqqrdMZfSdQYFREA3R3/s252UI2tn8HODQd22G5NXbejF7HLMgoTNlfImGS5pZgCPEbWHIUhFkxWkPmxWFy+88OOUZZU2O/n6bxPlL4y6eg7xbUv2d/rk07WVq59HEgolwrJozVobonUWLlhvdmZs5gjaVt22iqqomMUVJfhjLauD3ZP62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSN1kP1CaB/8fsbefXa3LnME1K/Rku67T2K9S2tGPbU=;
 b=mZkYx05tXx0ocFh/hzGU62jN8eJTmG+WlYOU8AVzSfOK1exaQx/BK8UCd6LUU5H0+f6bJQAlKrBAAQJMchujHwyW7p2uLcHRb3eloJ92GhwTLiPaGC4vi2qpGYSuQZu70gisNovH0lznx9qbu7WUVDZ8vc2M7W2F9yxwJ/S2CunrO3aT6kXbkQpPhw+hVdVRVJCSwEEtJUWJUigZkhCgb+exuThgaDZpS9zgMfx4mSgf5lFXG5pN6RB7vxMKexQsOFqjTcMGP34abiV8qgEG4Q59RxUZv2OKilHOoH8uUvLkeyEZDNAraL/QUHiEKVIx2Lj2/dPWhYAXvnk0zehi/w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB9245.eurprd04.prod.outlook.com (2603:10a6:102:2a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:21:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:21:13 +0000
Date: Wed, 11 Nov 2026 12:21:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, tbevis@amazon.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] i3c: mipi-i3c-hci: Program AST2700 IBI
 termination threshold
Message-ID: <avSkAIS82rYaLZvH@lizhi-Precision-Tower-5810>
References: <20261111-b4-i3c-hci-ast2700-v2-0-4d8fff5c5196@aspeedtech.com>
 <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
Content-Disposition: inline
In-Reply-To: <20261111-b4-i3c-hci-ast2700-v2-7-4d8fff5c5196@aspeedtech.com>
X-ClientProxiedBy: PH0PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:e::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 404362aa-3071-4570-18a1-08df40182fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|10067099003|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3g19CCq/+e0b2Qhspua5XJVgHxebLGPOTvuhKo9kr5RlIWieOu5U+ajlCqRwSLa9nBXPDL26Gu8OyA9ZGddi3tkmbJ8tQ1SFXdFafuBHmyzJE3pGKIWdRpqBhw3CAuxfgPk7QqRFiL4vh6upPAw8iqR1W+eQLjqmJWbvel259KQ2OBGlruCLHXKPDxiAgyqcgSzw9iyZFE6qEyBdACUXYZltjx7vBAUezI72kO31osu27dk5SAWzkRb6sncFZki5KBHj/f8F3cSrIohhDmzxa6lBfDt/HfIlIdq1kJnjcgEkKOJJf9sjHeBWQuFrHbR5tqWpagTA4+3Qsp66kRe4yTubuUD7FRlWQoyjGpJMIeLc3f4F+dnUgGZxl8uOnwMXMQRHUNIUTTUFZ7CRXkJJWuFQL/ocOv9Lap6IGgDm+tDdqQz4WY0zsu1iMQ5eEt367hrjKTs/FDJjXLi1sej7HzRG7p9bMPU94WGlxExFou/3fmfTdkVDWDwGKSjRNdASJIV0lHHfujc4em+OFQ5p9YHtXDjpmkuT/eW5rmPy0fAUOAHWdfQ7vIvg9BY3yEyDpDXoxN6ZpeN0H4mLMWya7QeF3k5ZMucL7TpGoFUonKFObBysk64o153PbKhOFJPO665EYs034OQcCsDfT57w1XO1jcMhktUSssERzIUfswc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MCC/RWgLfTFmmnwytkA74lkPf1RkII28LzXPpZy1cqry+LTwBCQP8FgXVeYW?=
 =?us-ascii?Q?uNp82zQZmHSQRDoDW7AiMCAlN0PPS7SqVOiQU9bWVa/qI4v25D+cJyC/knRC?=
 =?us-ascii?Q?9Iq7DVbb7SR/UeZd+F3VqF+XdUIxPdUKUGq8TDp64TSjqmeeJ1qX8t5LBeZ5?=
 =?us-ascii?Q?jaR3MJ9LbdJMzIhPM4z0SMraw5D+jaYKgMAiSM+GKDsyJFCM/f05aFpUzhzG?=
 =?us-ascii?Q?IyWdOcehyICCLIFfq+Q6d8f7oOtwcN/WSKSjSI0u5MovRkFDQJo8pmRhb3Nr?=
 =?us-ascii?Q?HKiN8s0MWZvShbxoHSBBI5QubmB1DiDVjIkwaZRflt3YWhxK7zfzDLg21jWq?=
 =?us-ascii?Q?lKtXhDN3bs3oDzA33P1pMKrdKzcfVRy3AfwX+IFw+uszCzLmx0vD1GEVfXZw?=
 =?us-ascii?Q?6x8ILTf0ik4GPGMKTDA5KH8MjFj+BKoH51QCI952VAR9R0EfIle0iAkh6eHg?=
 =?us-ascii?Q?Du0pMfJpH58ciZrYk4KY343oTIz1+LYnLGZOPyF8eYhU3JHQsqRcOUIc8rgP?=
 =?us-ascii?Q?EuZLBvG1zUt+z6D/aaTXlXWrv1bUveoJXqurzk1xiyU4WeKq0PfTawIs533e?=
 =?us-ascii?Q?sAAV7avkTXk++NyGkJxmOew29HeKGgobBt2XENYfTtYJsX21yPqzKr2nXzVe?=
 =?us-ascii?Q?Wowym0Fn0skG0alyy6A8+CU/bdS8h3mkss1UY44LgxTkXVxSnTqGnLSqWPmm?=
 =?us-ascii?Q?9uKxxisQQRjMGvADJ36mR4WLnG3fc2szKh4UsnMAVm5cyVScyBJspJZZzBZ2?=
 =?us-ascii?Q?Gyo5jFPoRw3xCmKRzf3sD7bKGrKweHGVLLIjEAziF1/m4IMruLmJYxd9ZOLs?=
 =?us-ascii?Q?sHmSCnYX6lsE1y5OVgDCnfHL81NWnR2gFT8AWeVFEkW8q43kvna/KjMwW/9m?=
 =?us-ascii?Q?Qqoxt+2qquNpbTZRhSLUCo8RQsfBO4Khy0M1fXhoIon5+jFQxDGJPxIwmjPz?=
 =?us-ascii?Q?6l2cyUf4L5Y/uD3eshG3E8UqaPnIQxFwSRHpOR7bM8HzeqYWtgtJ8gR821Uy?=
 =?us-ascii?Q?ExuoxMw4Ii4jPKfmwAmp8efBJ+mQ4iJwXHBnK1LPeVmBDC6fzpJ6TD/6WLkw?=
 =?us-ascii?Q?Hil0b2rrVPmC/pg1s1+h7HyKCSFw+hYggjj1BvxuTVe4Ldx7Dk73WumQV1/u?=
 =?us-ascii?Q?nw6nuadMQm2NUViBtp95DHPb6EisNDz6yToim4CialYDaF+ci5uQQV4Cg1qG?=
 =?us-ascii?Q?Efkq9U26kXTlhwt5LhMEMrERKFU5HAH3OvKHsV4C2FKQf2/t3gQpJvorFlxW?=
 =?us-ascii?Q?cnBtY8ktfhftDjrqo057IVXj1OpPS1IiFcVL9cMsG4MWmc/OyRlfiB3v6jhv?=
 =?us-ascii?Q?v5r7KwbLEzDEe761sGmIHoAI4IZvypKu1fbfgJcf5FRM2Z2zN29IKAMnplKo?=
 =?us-ascii?Q?pOyu437+jbwLTO6rl3nLoLzypjZZ3I0onu0TDhfzlqzsxhdAqMZg61zRn0xa?=
 =?us-ascii?Q?LbTbX8UIYiEHR0TvKD7+c9Fi7E8HWYg+s+6I+T7i2Bs6onjIrzFzB7ITPWmI?=
 =?us-ascii?Q?SX/cMi8uCZZXBKIK+lm0nNh0eoPHr+fK4Y4xffpeySDdFDNbuvkL+Ml9UNjz?=
 =?us-ascii?Q?J5Ad9VY3IhdB4e+awLn1p/9OM4eKD4465nFHGJoGXV5IYBiRxJ3Oe7s5DKb6?=
 =?us-ascii?Q?9DjazYuLRQ3BYEnnTY/ZtnW296oAp0XtvzZLaGYodXeUYJ1sQoQ2N9XYIXC8?=
 =?us-ascii?Q?XB/Mtj79OMheUaz95gyTX27hJVrZfY/Oqua6YHfZ8gOZZNtFq3KeoypuQgMn?=
 =?us-ascii?Q?hp7oCTDU43UBX3CZN5yWoeVJ2p8frEJMtbmLiuJRIuiG/JunYg2h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404362aa-3071-4570-18a1-08df40182fe9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:21:13.7740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jit8HfNwpb8plgWk6IRLYMdtggZZzxJdAHXXmKaq0qj8d9LwvNvJdiTueV29lsBQyhq7NuUV3Kc0XE6qsUrN9AxM59xlZt98qfdafhNtTl4NtYcVEyBIJNroKX9fyJMo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_092120_402635_FF53FC94 
X-CRM114-Status: GOOD (  12.54  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 11:16:35AM +0800, Billy Tsai wrote:
> For an IBI with payload, it's normally the device that decides when to
> stop sending payload bytes. A misbehaving device that never terminates
> can leave the controller stuck waiting on the transfer. AST2700 has an
> in-house IBI payload length threshold that, once enabled, forces
> termination once the received payload reaches it.
>
> When payload IBIs are requested, grow the AST2700 termination
> threshold to at least the requested payload length and enable
> termination on that value. The register is controller-wide while IBI
> requests for different devices can run in parallel, so the
> read-modify-write is serialized under the controller lock. Gate this
> behind HCI_QUIRK_IBI_PAYLOAD_THLD; controllers without the quirk keep
> the existing behavior.

what's happen if device A have payload 4 bytes and device B have payload
8 bytes, you set payload thld to 8. if device A raise IBI, what's happen
if device have not sent out earily termniate?

Frank

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
