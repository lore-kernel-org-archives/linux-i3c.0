Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71F9C48260
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Feb 2024 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b8Qo2a4FjDldnMl5iVnmhOMaz+JvpCqabflwIBqZVLc=; b=bdlPr4y06/tcsB
	EOxbZ9/u4lPcGWOO2wiKr8R1sUe97669jZeOqh22zJCZpqdCIqVs/ok2s2RNz8JjVyc7wIP44qHG5
	Ih2KeDWWbnShbSKUW2iDd2jhbe1t/mjU7smmhz6YBe6qP4e3ZZX+6jcctsxQ1nc3YmhHNbNfbjAfi
	XlyO1sAV7H5I2cljH3G1tMpKxgeL/IG4zhyB1j4ocSs6VZJsnAVng2TclyvaWQoeEnv2Cp351JUKv
	GHOvYCKMcD+D2p6KWLKvEBud3DoMmwwLqn16Qh1xaV3hfDgfNpAaA3llIfuxE/HfYFWPttECJQGU7
	Hlsec/7Ushs0E8X6T6WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8TL-00000005YyY-3pxF;
	Mon, 05 Feb 2024 23:33:55 +0000
Received: from mail-he1eur04on20600.outbound.protection.outlook.com ([2a01:111:f403:260f::600] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX8TI-00000005Yxf-1Yl8
	for linux-i3c@lists.infradead.org;
	Mon, 05 Feb 2024 23:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJxkct3qkoxNE2HLTx/OHlBi+XCZ/T1ZMZqgw4yPsGmzwHqO3O0kRYqN41ZshBU2x6DYElpIArjt3MKAexRoQziTMLCxAAs/+ddjfMkwggxP7iq5jYd35/iCRe1Uo308uqaY9m/m8xeMBQFkNN8KwEU72qcyC1UULmxKpHxwoTdr0EcMgug+b75XIHj/y3u04854riaqO2ntgjSULuhy1DwOi4T++QwKwBjo9juKF5FnvEIEvGwL+R4KFdxOk0Rrba+7DVyr69g7vxmoovzzCS8h/7aJAY9l4jmWRRt6jqfVCrwJwWW97OlmgrgU27/0ftg4+A4X3YV2gE2Z87s/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVGA0V38kN77vgCucp5oGoLS0ZunW6pqk7ibJsYCDHU=;
 b=Mih9zLrfu/nYjbxfk66K3sc8Nv2qU2v0nYEa7bajegYgThpin4EZMPZ+YBosN6gGKkTMq25U8f2O8JCnGIydn3KfjTgYnF9gbre5E+5HKsruXTgm2zhTmKGw4pmJit/tbwjrPOaSqnL05VE2JYHCmZeUQrpe0dMtnaKzBYmDsnM4XkrdwAqCj6F4oeq2kyttAbii9DTnMoEdmvkY/fZ/9z4QemTxh9J42h/RRziV1mF5C/Pzukne5z36tt2XKPwnqoVb9vYW6CJLa4/IFga1k94X14m1VvOyg32ITjiBHQ5HxqpkE6g7wvHq3Q8mb777MNeYq+bH5fANCBfL3oCXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVGA0V38kN77vgCucp5oGoLS0ZunW6pqk7ibJsYCDHU=;
 b=mKcX4CmbuTR6j2nYme/d9VhIWOxCZuYssPIbPGx7k9EZh5faSfdERTBhZAJk/vQx6Neasebr6mmMBA77cndtoLpQlvE32DYt7PJ3gsZDa2xYNB0jHmU6bdZOnO0EHv88odiPFPYADwLd5OItBlCqy64/faOfgILwVJlIIUW7tRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 23:33:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::c8b4:5648:8948:e85c%3]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 23:33:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: frank.li@nxp.com
Cc: alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org,
	krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	miquel.raynal@bootlin.com,
	robh@kernel.org,
	zbigniew.lukwinski@linux.intel.com
Subject: [PATCH v7 0/8] I3C target mode support
Date: Mon,  5 Feb 2024 18:33:18 -0500
Message-Id: <20240205233326.552576-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BYAPR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ebe6eb2-c5b3-4553-00f1-08dc26a2e3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXuFiPIg6joQkRNiNMl5E9tO1TOjWBP66ec1MIhc1TTs6EIkQP1iViBpWZSAzyy8mUEuPIEanYGn73nk2Vo73lk013LIfhkJxcT9Xzp2TOxgMw3ypNEFCL0RaI6MwrFct9v4bsrTqqUHZ2G2IY3gNv0pErPZnc6IU1+H7/0z+ImxdGt2bFc1bkAVmmjQkqVCiq7gWk5i+sCw+Fi9q7K35498Nf0Jkkh4l1zYKBbUZVX8+epN14ViFQOz8ZeIxFqCvKCYRNYLbS9eVWwONcr75FM0vy2SmtV4pB4XWAQL7PiUhe7xIe65mkPZmPL6hrBSw0qLfatWAsHsZX0iqos9hvTE9CE26HU5CgT+Z62hKVD6nIFcywHHA6GoMd4fb3bNEC69gH72irSpXo34FYkuI50OLd7C70CXGbkFnV5ALJJV961I+IidFo59ckJlIYjMfwAIc4wr78NlKxtRt+zsIlkaXC5fBNXmQp35Mlqshn39aXzmiTzxf4eSIXbCFLenl3Vl/KF27sj7XXmVklY4s680sVZmNUy7HV9qhzVKy5Sy8dxgq4XNOusoqRtJ4DYoogFIk5LxekoInhF4ZI+ZLFQFEl8S9b4zDOQ+Cyl2+r4X40LO0EH5CyyjjolajpJu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(1076003)(2616005)(26005)(86362001)(41300700001)(7416002)(6486002)(5660300002)(2906002)(38350700005)(316002)(37006003)(66476007)(66556008)(66946007)(478600001)(8676002)(34206002)(4326008)(8936002)(36756003)(6512007)(6506007)(52116002)(6666004)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g783GrfAzIEPrZR1ytnzCwA0R32P1B7LsnVCiHnUhA5gaEVlx1kzTsMUOrQi?=
 =?us-ascii?Q?2BavXVdj1bAScz/gOTxJGNzTRP4Voiw1aBfhj2lmLm/GfLALc2Dn9pUxYTux?=
 =?us-ascii?Q?vNeX874ARPk1Up18ZXOGvsuZRfJO/I3ErUyFj7JrcB1Zv+qQgLKyhk30jXgj?=
 =?us-ascii?Q?33flL8JTlJ/3bK+D1pETgmJT6uRvp4xytKIgCZAcKd7DFN40E2KIVnYMTKNq?=
 =?us-ascii?Q?atIMkIKIDCxO1zggNdRagrTX0r+QULXdtpWTQUJy53mxgzoG7OI7wAyiVc2w?=
 =?us-ascii?Q?olqweB9bvU6D9Mu3V0cBjaLuVVz8rSGbfPn0SwFRp5uBZMtqR1I6jqDciQ/7?=
 =?us-ascii?Q?QtRnXy8vRbNdGUKGfUjoDKMW09I7CbwrftcK0rnj+Es8O31kcPsaOMFucjY2?=
 =?us-ascii?Q?9be9jLsGRKOaFoTSH40Kk4ddoAR1sVmyr9zq3WWeVI4S46CSoIFn5qdVB8DA?=
 =?us-ascii?Q?rxSYKxwI5BYZMu3HXfw9/XcsO9YGZ4jQ+Hca0Y7FKlud0I2hJuDDn9uLZ94t?=
 =?us-ascii?Q?Vpi/6ZrdCkEpDg5Fl17cedlWgap/IaYtXyyRK3GD2z28MWvqd/1uGNRtZ8Ap?=
 =?us-ascii?Q?nYwrjBAgfsskum9z1EcZHF9rUZ7ANB7lsFjj9IiiygEdqHqJf5uZ5F4P5o14?=
 =?us-ascii?Q?pPYDMB6rviTaXqw704Gdaq/2WRFztsTW0gq98rCTpA4rA3qyDBXiXSNtR/oW?=
 =?us-ascii?Q?jM2A1s1AgdR+SwzQJE1nolEa9xgaoIa4plxzjk5pB0BntxX6ZDwHBT+Uc+9i?=
 =?us-ascii?Q?I3eL4aTACeulwVXVpYMO3F35uvcv39VErOyWpZujeYGE06bfg9AqfQS9NbJC?=
 =?us-ascii?Q?BVS7ei6qduoFXp0SF50oEZCmKE4xU1eZURGs55YnaKnO0IIzFyhM7ZVw0JBg?=
 =?us-ascii?Q?DEVjirGJ1OahEYfaqecEZQdj5nfmlJalY7VjeSse4FaJUly1AwSUS+v7gxYr?=
 =?us-ascii?Q?pppT8leDqnvOFZWTf5Rs+9HtHt9nLDhZoSO5ofP7xycUKsyikoBjSl7Oj44g?=
 =?us-ascii?Q?3PPT1ghqMUxajq5Olx4+sFtyM3F9HvtnTYJltQURVqUAGU4qEUYLZQuHcdZp?=
 =?us-ascii?Q?EA3PmesSco+9+0VHSpo0c/wAnZ/+GXvUGSHjCFVweZtntcEhxCeaES3FAygo?=
 =?us-ascii?Q?r2xL0736Aef9S03HUpZWPdcV5BXknZPAoUotZ9aWMRzLwIYb7vW1XZ51U8Zc?=
 =?us-ascii?Q?Q76DoC+kWlNONbhVhPbkq26AmFrz6Wa4DJ04HTkvotlJIFaOICLH51cOwO/F?=
 =?us-ascii?Q?aCRJLm5KCOpeL3Y0KQl/y130Ko0Lx2X/QVpLgZj794QXg83FyIqF6TrLtHLY?=
 =?us-ascii?Q?sR22AnQUtNrKkX+nhbmiQwj8TOq9KOJC+1WrPy4MdjNB9DFFhen9Dk+MBXpc?=
 =?us-ascii?Q?wqrZUHQESay93xyeIWKzqB3suZoKb1CaIGBUv0Irtdoor3BxIXYIrbwuIPtC?=
 =?us-ascii?Q?1IY0e5PHXDVKcm7JzbvCchgWXpMNVCQ/FmoGBwQuNDiZR4s4MvoqvJRsSEtK?=
 =?us-ascii?Q?nl7ywnZUc2S/3O47pUvCrfklYBcbLVdVZjYxB/kYNTNavn/6JlG3mbboTccm?=
 =?us-ascii?Q?noGkCOjIuEq8V8qgud8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebe6eb2-c5b3-4553-00f1-08dc26a2e3d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 23:33:43.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14TwDzSSLek8xWamliRII9yR0T+BHXW7PpJ4jppdPqbXR/YtkC0q5tllzSZRKChUkPOmrJhLM/0OowcNP2bQ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_153352_609514_1EAB33B9 
X-CRM114-Status: GOOD (  14.05  )
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

This  patch introduces support for I3C target mode, which is referenced
with a PCIe Endpoint system. It also establishes a configuration framework
(configfs) for the I3C target controller driver and the I3C target function
driver

Typic usage as

The user can configure the i3c-target-tty device using configfs entry. In
order to change the vendorid, the following commands can be used

        # echo 0x011b > functions/tty/func1/vendor_id
        # echo 0x1000 > functions/tty/func1/part_id
        # echo 0x6 > functions/tty/t/bcr

Binding i3c-target-tty Device to target Controller
------------------------------------------------

In order for the target function device to be useful, it has to be bound to
a I3C target controller driver. Use the configfs to bind the function
device to one of the controller driver present in the system::

        # ln -s functions/pci_epf_test/func1 controllers/44330000.i3c-target/

Host side:
        cat /dev/ttyI3C0
Taret side:
        echo abc >/dev/ttyI3C0

Chagne from v2 to v3
- using 'mode' distingiush master and target.
- move svc-i3c-target.c to under master,
- built together with svc-i3c-master.c

Change from v1 to v2
- change "slave" to "target"
- include master side tty patch
- fixed dtbcheck problem
- fixed kerne-doc check warning

Some review comment may be lost since it is quite long time since v1. Now
master side dependent patches already in linux-next. So sent target side
patches with tty support again.

No sure why an additional "\r\n" appended.

Frank Li (8):
  i3c: add target mode support
  dt-bindings: i3c: svc: add proptery mode
  Documentation: i3c: Add I3C target mode controller and function
  i3c: svc: Add svc-i3c-main.c and svc-i3c.h
  i3c: target: add svc target controller support
  i3c: target: func: add tty driver
  i3c: add API i3c_dev_gettstatus_format1() to get target device status
  tty: i3c: add TTY over I3C master support

 .../bindings/i3c/silvaco,i3c-master.yaml      |  11 +-
 Documentation/driver-api/i3c/index.rst        |   1 +
 .../driver-api/i3c/target/i3c-target-cfs.rst  | 109 +++
 .../driver-api/i3c/target/i3c-target.rst      | 189 +++++
 .../driver-api/i3c/target/i3c-tty-howto.rst   | 109 +++
 Documentation/driver-api/i3c/target/index.rst |  13 +
 drivers/i3c/Kconfig                           |  31 +-
 drivers/i3c/Makefile                          |   3 +
 drivers/i3c/device.c                          |  24 +
 drivers/i3c/func/Kconfig                      |   9 +
 drivers/i3c/func/Makefile                     |   3 +
 drivers/i3c/func/tty.c                        | 474 +++++++++++
 drivers/i3c/i3c-cfs.c                         | 389 +++++++++
 drivers/i3c/internals.h                       |   1 +
 drivers/i3c/master.c                          |  26 +
 drivers/i3c/master/Makefile                   |   3 +-
 drivers/i3c/master/svc-i3c-main.c             |  80 ++
 drivers/i3c/master/svc-i3c-master.c           |  34 +-
 drivers/i3c/master/svc-i3c-target.c           | 776 ++++++++++++++++++
 drivers/i3c/master/svc-i3c.h                  |  15 +
 drivers/i3c/target.c                          | 453 ++++++++++
 drivers/tty/Kconfig                           |  13 +
 drivers/tty/Makefile                          |   1 +
 drivers/tty/i3c_tty.c                         | 428 ++++++++++
 include/linux/i3c/device.h                    |   1 +
 include/linux/i3c/target.h                    | 548 +++++++++++++
 26 files changed, 3713 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/driver-api/i3c/target/i3c-target-cfs.rst
 create mode 100644 Documentation/driver-api/i3c/target/i3c-target.rst
 create mode 100644 Documentation/driver-api/i3c/target/i3c-tty-howto.rst
 create mode 100644 Documentation/driver-api/i3c/target/index.rst
 create mode 100644 drivers/i3c/func/Kconfig
 create mode 100644 drivers/i3c/func/Makefile
 create mode 100644 drivers/i3c/func/tty.c
 create mode 100644 drivers/i3c/i3c-cfs.c
 create mode 100644 drivers/i3c/master/svc-i3c-main.c
 create mode 100644 drivers/i3c/master/svc-i3c-target.c
 create mode 100644 drivers/i3c/master/svc-i3c.h
 create mode 100644 drivers/i3c/target.c
 create mode 100644 drivers/tty/i3c_tty.c
 create mode 100644 include/linux/i3c/target.h

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
