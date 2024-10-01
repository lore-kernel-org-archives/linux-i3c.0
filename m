Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EED1CEACF1
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W/QntBwxRXBFEu+Bm2U/NcOJy5Vkc+UDubBwR8V1Le4=; b=OPole5XDEz0dXR
	Vcw/rHZjABwRQ+zg8DR0e55zVeeIJP7Jyf4pWaiEYfhW6YIRgVv13n5kVsKiomlDKdzwbwY/JZLri
	NQ9QBP40x09DeFbJSgTnqVT3rAQDdbQThjzbucZlq2IHbkLNb24jS5kqDdM8AWguZ8Au6tnWb+OSR
	73f8Jr+k7gky3XUUJ7dqgCa1l+s5BBWOe8PnGk4JJxz8X6pH1PU+qOXrqpfNX4ZLtfEwL06/0m6cU
	0DBVXHewp8mNd4lQeuHHGlmRDEyL6uAJ78nGzvq4WRN0lrWrVPUAxzgHDId7sTX6WqsqbzoluMxqI
	pCh7AHGLYI5oreQQGVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svhtS-00000003oB8-0uXZ;
	Tue, 01 Oct 2024 18:46:42 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfsw-00000003ZVC-2WcH
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 16:38:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niG1O8NyqlPpi02lWlhYaNRO50Jwx5MMzzsXduMjEpRwt6menv+ggQ4fffBLDx0XqgpWhF9RqHCWcA8oCcUNplFoBws5m4vd+9NBfFaO1qY7igABdLq7QCACTkN0MbEIKNp3WZwGUfDGKVpfqDZv3/pYIJGS7o1ZP+Fd+puYZ1MRUedbnuN9B+uCbKaykTF42Xp4Rtvjb18/j5ukj+C0JhoG/GsofrcWDqWdzQfvsweijzbNkZO9VI8uYui+fy1jQym/ycp4QFXQYoJ//p2/igqhVcfIXJAgxXhXHrsBtkV4Wf7fKHcW+w+FwL9gXjtR8TSGBNH8ZCOY2Q4vCOOicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRI8DDIC8k8H9wg9b0thZJzhZE9koTBkafKJEeEb8mw=;
 b=IfzB09i064XidXzRIZOLK8aQcBd5cTQ4PyuN8HsVVP1Kx7bgsFnkBtSgB3hHuA+ZFePHUT2kqZ0noCgK4USM2hec/Yb6L0vWLiE8ed/jJh3+GnphGh9SZQnce1szHZTdYcWcZCSmJNL2LN4NxLJnssGN64x+AzCgd7DiNKvVcIGEO0pPwP2pr4SI4LEvExw/fk/5yoR+ByFXMP8dYMo5m1upTlbHw6bNVEFJpbZhgJuIo5eqXWI+RKcucNKEnFqb3Zv5JBTmCz4aDuGVBDNNCVmndipf2pj64y+gAZgPE7Hb7K1OR3PjBdW2yZINi39yepndiszXFwAy0rPLVUlxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRI8DDIC8k8H9wg9b0thZJzhZE9koTBkafKJEeEb8mw=;
 b=bJpINRCXtriiA3EYqfcOcJC69C+XDwXS9l3WZOm1ozDqyTACSr5uDOp+ivvo2EcB3DwnVrWV2UtqPZ4Q8iiTOwU24zKn6sh3VeUQYCxb3m3p2c9SqifneLUIJ6vD9dwjclgWVSYCNpmDc/BdNo+OPZ1zSexP+qSJLg0kexUMsunR05B7JNCkDfceJecF4RiarCQ8l55VpxH3CZe5/iisATsLxK74wPXV3z65iwcmBCoM5/RUNgQgyZHVmDkMAPb3u93Q68k//XbJFcsxqCD7KklpKJsShj6Pe9UG4vv9+aEsnrFiIZDgMO4hmkmHj7wQvFG6pik86JUMrZ5vkOEmcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9432.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 16:22:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 16:22:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	arnd@arndb.de,
	bbrezillon@kernel.org,
	boris.brezillon@collabora.com,
	conor.culhane@silvaco.com,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pthombar@cadence.com,
	ravindra.yashvant.shinde@nxp.com,
	stable@kernel.org
Subject: [PATCH v5 1/1] i3c: master: Remove i3c_dev_disable_ibi_locked(olddev) on device hotjoin
Date: Tue,  1 Oct 2024 12:22:32 -0400
Message-Id: <20241001162232.223724-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: a89a0114-308e-4894-609c-08dce2354a8a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XMViSwHkFh3enjUd0T+khZIYJTnCHDffsBN24E/qVilpoc4OvyepfBsQWX5+?=
 =?us-ascii?Q?42ju9scBDiMLlmnUvnY1/koHBGS9Z5uRaIZ6FA9vKTGeNKjJqa1VbLpx0Kny?=
 =?us-ascii?Q?cqgkclBxVh/gTM0U3CJIPER+wm6T9hhdXcNfiHppuY7i3UY4/JnzzKNXJnZA?=
 =?us-ascii?Q?YxudOrn7gPzMX0vfrqm1mIzNilXQiRdfZdPz9GNkUD1HoHhzgAbPtrX2oHp1?=
 =?us-ascii?Q?IAuH/XbUlkWB/mHT/6LLF82QFOaHzCS7b1bsKy8mxGRfwaPpOWhE/GcCmi3j?=
 =?us-ascii?Q?1baaTztkuHEAUAwKWFpp5ZkIIOj9us4zPpAJ5MeV3Sg73SU74d4iiikYc9lE?=
 =?us-ascii?Q?K57ZDYNgoGDtKXwHqOblTbwtm2EQU7uhQT/ufF++fBGv/OMibZzN9khpJgkP?=
 =?us-ascii?Q?0e4wLaYSOWaKDv4TF0jxswwXI+rxGAJyiSS5kKQCpBkO1WWLxsDUmB0rKiR6?=
 =?us-ascii?Q?dp1lAk1iCVHkur8DufcITPFd3Q1NBN0BFti0QBC9gLPhWxHWF+H6UulDyCA4?=
 =?us-ascii?Q?jgDoCM+UaQAK7hJMNHXmdB5i8lYEWqYFXiYTeCvADfkRW/Vy5k3haRqaiUlx?=
 =?us-ascii?Q?wN/pkNZvOWXZhTXMP0g30sz+A83dSeIPKICU95Pdraq6Q1T9L5lYqv000s2M?=
 =?us-ascii?Q?KQA5OwjLS22P/CC37Lwz7YZtvbXwLB3rFEIc+k8jUgdEO2mNWlViN2YNQ9h6?=
 =?us-ascii?Q?D1sDKaCC0Wayn+sssq2ZVKr2eoMEjzwYswgvb47DK01aCzKDPWrLfo9WAWbB?=
 =?us-ascii?Q?4cMR0p4sKicB0I8JbcmACKfZUGZvut1K81oNCS+m6TLgeVrKSS0T9gtLgTPo?=
 =?us-ascii?Q?Mj4ah2NFo8wLHA/VM024E4GJi7czvwQi3ffY6bl9yIZNPJAG90xvA9vON+4e?=
 =?us-ascii?Q?fmRgh8ViH3Ga9vjvcCYmUD7+j++5/qNODcN8oJCAwYKZYdtgRqbkdOqMsEIR?=
 =?us-ascii?Q?JABIj3KaowD2L/uD6+JgF7vgBmJpwWkpPR7QUFJe/Lnj+/qWAKaJm8+t1T0W?=
 =?us-ascii?Q?WqXG1+giqoMNdrnbjSCQrOb5532xetVxJ1JgFa3WANpalD1bdcwsOm6KyTtV?=
 =?us-ascii?Q?p4+mPeXdDft6T1E2xN1loWJTAH2dDnF6Kq1XYWCT9PFCGC35eS5Sh1sqfiSg?=
 =?us-ascii?Q?fI2vIziU1kddqIX7C2zw4i9TjWn1nsIYx9k8SUu2dH0W+9t+MTAVN1mKkZm1?=
 =?us-ascii?Q?bLro9NSPAsEbhxxP1HN76cw8e6Frqw1qHe66trSOMcb0MiDaglq/3rKpj/RR?=
 =?us-ascii?Q?7mErKan2LRJDazKV0Tt7rMz1xo4guuLgbZ/8fdObXqlVsS53wTPdCCJaFg50?=
 =?us-ascii?Q?8+8nBwvGps4bfXEDglPTQizqzFatl2reZrT2VajK79gx4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ScPQBJhey0lratUxvkeXbjXEGnKgC5HpM9F6Qh7n0sWayg2iT2Lfv64/I5KA?=
 =?us-ascii?Q?TPvEbnCHwzQywbqg2pX/1gBfX3B1QdUyKMCNpFc6VLO68Ap5tA8GLDBs4B5q?=
 =?us-ascii?Q?IYhLs9Jp72YXU/py6JlZ8snGsewj0HX+zZZVJzyNoS8b35hPtP6Mf0AtoF1j?=
 =?us-ascii?Q?pUKVKbRuebLCDdVoqFfJ0VJiGOTy6RhCLj0S9j+2wI8/HZ9YlXUeXz3j3E9k?=
 =?us-ascii?Q?DfDAptODa60IIN02fK9gHYOp2D0+ScQ/c0aeFngsR1Rp7wNOsNE42fZmcUeO?=
 =?us-ascii?Q?n/c3SL1nBDvo7Rrq0x0SAEkOLKm1vr9s2B9Q0MxedV4HazgFbm9RPwYYGoN1?=
 =?us-ascii?Q?xgMsV4EjDbqgItXmGrvIlaeGP6UlrxeqUlZqiS9ITCzb8TtX15DBr15Iemzw?=
 =?us-ascii?Q?1cuEF1ZxDv6VkZHl1/PYiX3TaMzXXl6Jk7SI0hqY+LU0BrijkNoecZMFHs2Z?=
 =?us-ascii?Q?VM1j7DMJnbu5sh6kFYmxXUSl1ZVaOy/KIlwFA0s+N83pIKQlUmMCi7kzyyAX?=
 =?us-ascii?Q?/WhiuekQrd/c+jgnJ5LhmqPs/cXx1LspPk/ldFspnG1gQ7+Jebr/Dn/GFIL+?=
 =?us-ascii?Q?+oy7WE4cvj5ARpZwGNTknrwIC7Jo/+t6avn6c0q1j7h+Q+mFXj1mLndabTXR?=
 =?us-ascii?Q?dxJUPTnEPinL8WPi7xRLyYD1WIb07RMVFSttnrTfzmueOexVlng47q19bTld?=
 =?us-ascii?Q?GAvH41Kvm4Zg8Nx1Q967613CJ+JH84OSBhrwF1xTRftgrXi9mxN5pbXYCwla?=
 =?us-ascii?Q?YN7+qPcZfZj1TU5yuiV+x59JAfwMkbcm3Se7rX5CKtQT9fL8l0liFmGosLWM?=
 =?us-ascii?Q?272+Nf1v8ZFtpDjEZrRQWNI1Y1CXlzq4Kad4nRAngGYxA9cwc3Y3RkR9elIM?=
 =?us-ascii?Q?h5lOg6AfIqRDTSiKHKP6wPnlPQUKm/TTUoRC7fQzagESPR3DNPUulJgLnjti?=
 =?us-ascii?Q?GxXX8D2pzu/2gl2kunfKBOPPJ8e1gIaiWmhMyV9o3P2seLgbMnpBeq+oADRa?=
 =?us-ascii?Q?hi96GLBp2gp8Oqza6IbtpnvQNdLKl+UAc7E7PRQmWfBid4vEhu4f2rfX9zsX?=
 =?us-ascii?Q?hXEMu/996PfwcLJ91Gl7FLRKnezucib+E3QUGx6z4ehYfUZ57F6/6eaX9uhI?=
 =?us-ascii?Q?ultMNfdySIBkk21tgrZOl0idktDd5TgDgt7gGvJefpYx42g8GNpsr5dSd0GC?=
 =?us-ascii?Q?6tztl5vL0jJWJS4bTma0hNW9w5JpEHmU5rPo+WmWMjQmo1QbhsXhb43mrUiQ?=
 =?us-ascii?Q?PO5SXu5wmsK515eWsuYVxZMaPv9UF6cdazHhUhDcN3YCzKGKp7gPPMmCv7cP?=
 =?us-ascii?Q?oo91DkJGvEdjJlEKwOXCuqupMm6yqEqI+lRfvXTN4SvXQyB0jB1e4Gx5KaDj?=
 =?us-ascii?Q?+X1SPmTjm9OrYZJvxSI3rsxJl5XcJarOs6nXEfXT+5Piy04rw0Po5FKpaCvI?=
 =?us-ascii?Q?Tr6dfOaaeF1hyX960Xz8IwX2FznLHeZI3mquJp1+vqpSzyEqR7WQZ+UStmEm?=
 =?us-ascii?Q?y/2qFtow/aZUbOlIy+JxELcXWKXX5rBpIdlDzzYG4/L/tppmjerUb1CA+9XS?=
 =?us-ascii?Q?42aCNJTqv+y7OLrEEcUGZp0M0JVtduy9fKdS1aqs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89a0114-308e-4894-609c-08dce2354a8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 16:22:49.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P573wH/CicGljll5N1WV+WtBdEJ6qhgHW1DjiifkZ1hYBQGKwOL/7wvn9DstGRLkgQgMseb5++DrLX0Nsmrnag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_093802_654662_AC77E735 
X-CRM114-Status: GOOD (  13.11  )
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

When a new device hotjoins, a new dynamic address is assigned.
i3c_master_add_i3c_dev_locked() identifies that the device was previously
attached to the bus and locates the olddev.

i3c_master_add_i3c_dev_locked()
{
    ...
    olddev = i3c_master_search_i3c_dev_duplicate(newdev);
    ...
    if (olddev) {
        ...
        i3c_dev_disable_ibi_locked(olddev);
        ^^^^^^
        The olddev should not receive any commands on the i3c bus as it
        does not exist and has been assigned a new address. This will
        result in NACK or timeout. So remove it.
    }

    i3c_dev_free_ibi_locked(olddev);
    ^^^^^^^^
    This function internally calls i3c_dev_disable_ibi_locked() function
    causing to send DISEC command with old Address.

    The olddev should not receive any commands on the i3c bus as it
    does not exist and has been assigned a new address. This will
    result in NACK or timeout. So, update the olddev->ibi->enabled
    flag to false to avoid DISEC with OldAddr.
}

Include part of Ravindra Yashvant Shinde's work:
https://lore.kernel.org/linux-i3c/20240820151917.3904956-1-ravindra.yashvant.shinde@nxp.com/T/#u

Fixes: 317bacf960a4 ("i3c: master: add enable(disable) hot join in sys entry")
Co-developed-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
Signed-off-by: Ravindra Yashvant Shinde <ravindra.yashvant.shinde@nxp.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v4 to v5
- none
- just split from big series because need more discussion about dt assign
address.
https://lore.kernel.org/linux-i3c/ZvrAuOBLgi+HtrPD@lizhi-Precision-Tower-5810/T/#t

change from v3 to v4
- merge https://lore.kernel.org/linux-i3c/20240820151917.3904956-1-ravindra.yashvant.shinde@nxp.com/T/#u
- add Miquel Raynal review tag
- add Ravindra Yashvant Shinde 's signed-off
---
 drivers/i3c/master.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7028f03c2c42e..82f031928e413 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2039,11 +2039,16 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 			ibireq.max_payload_len = olddev->ibi->max_payload_len;
 			ibireq.num_slots = olddev->ibi->num_slots;
 
-			if (olddev->ibi->enabled) {
+			if (olddev->ibi->enabled)
 				enable_ibi = true;
-				i3c_dev_disable_ibi_locked(olddev);
-			}
-
+			/*
+			 * The olddev should not receive any commands on the
+			 * i3c bus as it does not exist and has been assigned
+			 * a new address. This will result in NACK or timeout.
+			 * So, update the olddev->ibi->enabled flag to false
+			 * to avoid DISEC with OldAddr.
+			 */
+			olddev->ibi->enabled = false;
 			i3c_dev_free_ibi_locked(olddev);
 		}
 		mutex_unlock(&olddev->ibi_lock);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
