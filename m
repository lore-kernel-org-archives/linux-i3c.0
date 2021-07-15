Return-Path: <SRS0=stO+=MH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9E7C1B08C
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE2B61370
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jul 2021 08:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE2B61370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RqRDa0UbSAuGkBY0g8slzpnwvhAbejcwoChB1ODNRls=; b=MRwK062Qk3wzoV
	1hbZSMcVc3/yi36ZZgs6yWr9l2UfBWCtzAYe9iXHKnRZtpxXpnbnihy8Y0IGkHq8Kl5EW8J0IEGXh
	94FdiKfNRpEZTSMZnNOutuA8L2PW1EjLpsM/A3zdNyN+e1dSoVR1bt6e9JfFoPANOp+8MJa4lq7Db
	Lh7FizKKby9xNfdqU5c/Ta3+kG1ymP/i7K06Pk7QUo14DLGpVUrHpzbxsFtB9ZzNu2bDsHu8N7H+4
	3DZRmShAjV9bGy9hRb3pyNTZ2oeU/3s2TcmpPe1FPuGDdAj3CbTas2wR3xgS7dKu+HIJw0wJbmiDG
	K4VMmtSO9PcTL6jAMAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3weC-00HUk9-WA; Thu, 15 Jul 2021 08:23:09 +0000
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3weA-00HUjB-53
 for linux-i3c@lists.infradead.org; Thu, 15 Jul 2021 08:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPwFzy97YXSXaYx80+XDLhm1/ei+td1nUpo8zKH13wJXpHLzENvR08qTs25R8OMRcEHNQALT3LaHdUadRX9FDiHxtXxVm2CfKtAmYT3YGLgQaov4TKRE7nv/bxhDNwrPczQxRGPmc7xLuFGQZawDge56ZBzK2Bk81+Zin6Uzg7YlipbtGkVCxQ8jvlszrUh9kBk00/o5t7fiIv6sRr7C6PYv306R4AZli2j4aUVZxoamiuRoBwj9LPeQyhxm1OuHScIhVDjM1/3aGBEwNzdqD7EyQ7G5Q6zofqoQOa2K+mZLjSJgJO8vqWBWivO10M1YSOn999UTTomlk6/aWV1zfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZlp/f5cotkFO+DuFBIGs1nuHZcd8LjKfp8nsJgmEAA=;
 b=nX3CC5ds6n2A0OhRJSBwKbrYJjA4bavBUtytpC7HHmmBvbcq+VPSmQU7TZtyLzTxTWzG8BXPJLlFxSwPNgjodpAYS3/CNPmsnOr/wJcRd85TRGbIYeykXc82PU3X4kLVWELXl/XDkdXsnwJcVA27tkimnOZly+vsqlitDWudZlzfg9y9/6OapqugG/nBrqFjZJZKl+RwNmh8JDsjUd9DGlnSnXVv4+r7HbP/Ta9VbqC7OFbiDNascuawqHUtRRyuOI/+sD/ZhZFKQyiIhC/oQ036+RzDCo0PxmBwACkyjkJsQMNXXOwnDILbve/g4ozR0LlxtJxwKmrfd8If+ZmxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZlp/f5cotkFO+DuFBIGs1nuHZcd8LjKfp8nsJgmEAA=;
 b=FXGKdIxkg+j3y+n1nSPHwxG0NzMlyhOzGXz5CyqjLBgXzGnucNLQmrf2veItIqUZiDTz903J+6Ia0JRxtlxTsZ7sqaxuwXzWNMJrRwOEvvdxusDIb1pyYDBTjtNS1tAVfRNpDUL7cvRdo35UbAX/wxFQgPdmsTRVcBvTOsjZ3f8=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM6PR04MB4167.eurprd04.prod.outlook.com (2603:10a6:209:4e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 08:22:59 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::74f8:10b:8efd:b265%5]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 08:22:59 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 alexandre.belloni@bootlin.com, vitor.soares@synopsys.com,
 boris.brezillon@bootlin.com
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaoning.wang@nxp.com
Subject: [PATCH 0/4] i3c: master: svc: some bug fixes
Date: Thu, 15 Jul 2021 16:24:09 +0800
Message-Id: <20210715082413.3042149-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR03CA0142.apcprd03.prod.outlook.com
 (2603:1096:4:c8::15) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR03CA0142.apcprd03.prod.outlook.com (2603:1096:4:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.9 via Frontend Transport; Thu, 15 Jul 2021 08:22:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2289de7d-7c3c-45f2-81e3-08d94769c162
X-MS-TrafficTypeDiagnostic: AM6PR04MB4167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416771F2161F2CAC280612A9F3129@AM6PR04MB4167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOF3KXoAP98lrNJlo/RYaH+uWNT3/mZnxWofPwGGuxK7nT96ERiJNPL17IbbObVMMgADPa8sNLE80nFFL+v5RGCr+evCNOkERmcFZynaVsz+7xS8JvpB4zI2tCauNFlkQrN0dV5Eazv4ich7kid8o5FQ0cmzERsKRD78Fn5/6odL8RiWZW6l8UhQK3vf/XubScoYuv8lh5zsDda6uqqP9OCfeOrIP8o6Gr31Uqyd33j5oxt1okyB34jpP6YtCPqiaV1nf3aJxUo9qWF6EFtP/Q2ptsVXYyUnxvnKa+4yGdLo8PVTt9AZDB8mFg9w/7CXg+9nrPD2S3F19t1TfSH6jEHA0nDc8GhWgzOdd++BOFHt7Cc7m0v3VuaYoiVuLJr+1VXroaolpazeupGGMyZe5ULrBoU+YvxD36o7UMN6x98InVydTV9yOKTSN/iGuNJ4bplon1I7Qky5jIAgpxkRR/L1Na11pOvhRZVM2j0us+KIRT8+TyIUVj8dPyNanJiO0CnjucXOB46DexLKDt5DIsdGvDiJoNaH8G/kAjBUX1G5NBFqoWzuggbV2chrIuI2ZmJjmP4ckGtxGlNRSxumXLhtrImpoh1KDWf45yvLEN+aqQDK3pTILCKJWMl+sfPaye+lxS8T/7unxAz0h3cCZnelLtVuNQYiMBC5RfKHFXes3obbImwjQqMLmPUkBHHPjtEwexeMh/oW+0DCbPqGz5NBgWxfcBprG9YOyP9HBbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(6512007)(478600001)(4326008)(83380400001)(8676002)(6666004)(8936002)(66946007)(86362001)(316002)(36756003)(2906002)(2616005)(52116002)(1076003)(956004)(5660300002)(38350700002)(6506007)(38100700002)(66476007)(186003)(26005)(6486002)(66556008)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j98vDVRF28eW6SrvidN3rrnAf0vOTI/aruQ5YZl+7i2IY/lLS6m9EOiHKSI8?=
 =?us-ascii?Q?Q0MeiLqE82Tx/gVaHmP5E5xViiUwzhhCOtBgtgpR1LuvXkb3zV2uqIZ5BcbI?=
 =?us-ascii?Q?16eII31Qshd4VcuFia/bydiZByy8KiO+dpBJlUFxJ5BthZZc9McmMnFKNKe1?=
 =?us-ascii?Q?zlUOP/8Ca3fekwCeHS3n3wwJ3gbRbK4jCHbLYiayH1BdpxrGhpADVSlVilV1?=
 =?us-ascii?Q?9XfWo2Gxm08ZfrdvFWL+Kig0xQxoBX/ieQrZiyx8N40LnI8IdySyCFu517Zw?=
 =?us-ascii?Q?q5PL8DbkmXJly4OGcEa4QxzKM7gXGMLLqkoS9JjNGxFha+BGA2BRZwdsDnMO?=
 =?us-ascii?Q?JyCUemIrdaUyzuMa46jvDuug/9eySc6wVuaYifSAhhz1wud+nNYwxhQL5tmz?=
 =?us-ascii?Q?wzCMo/p/EuPQyNThku+YDhVBkv7GW6VHmPk4SNhAFeo+rO8rLt6OX4C/XHYU?=
 =?us-ascii?Q?3Iu6FMpe29gBPs33dNlbbmQCRPpVwwkFyQ6QAauKYVFSHS135fl1B/O/Cui3?=
 =?us-ascii?Q?qiN7lWZXVBfKx+eHsl49Qs6U/FoVcRDptU0J7X8u/4FgOljiWJBK2pazrmDy?=
 =?us-ascii?Q?SpsQ8odxdmgEvDFbeFT9/xIL6yFDLc4m5FU04XeONFAZXlrQ4s/d1XhC2yhk?=
 =?us-ascii?Q?1cdWied/2GIsJlIBF//zf+db2Rq3bqwAstunjkdVfSR1Wxf08WdCAPbx/EbS?=
 =?us-ascii?Q?0BRi6W5wKRwqyBFL6qDph3hug0PgVL/7zstM54SRTkw8y7ByFq8GYvJ5O3b3?=
 =?us-ascii?Q?6x0KAPQvoMbmsgy1jYUm48C9Etm2rNiVi1UuLZfz+20fL7Ox3bP4vrqZHabb?=
 =?us-ascii?Q?Kf7Mnxya2hlJ1zy1RgLsZV1QB2j6DV9qMmCFtKklryVubYejdW7Uh9nk+3wV?=
 =?us-ascii?Q?z9YMvDmhMWDNzdaxgGOnh2nu9oM0IsaBQLmBdV0hQ3hAWxLCGJCOiLyMg6wX?=
 =?us-ascii?Q?7DNDfYH0VN3L/gnfMoL4PrKc8LO92yi6QLeSYE3ZcdSWcxVeIwmYzj27Jx5l?=
 =?us-ascii?Q?SJAImm3nj469txBJ6Jis/1Ks+pP7MX0Ws4mQ+7SmS/F0B3rFd1DZXGPZ1eAw?=
 =?us-ascii?Q?pWvF48ixa/GUSXfaCKFequO8qbDNu6d4RnavFlanywRG8gIaf+jvJhrI+lYg?=
 =?us-ascii?Q?GKGiFaVcSruy1KTEfmX0DRlP/T6BYEM/5ElYW8/a6bb1qa+Z9gnozdqFPWFj?=
 =?us-ascii?Q?KuJPzT2YKkjO+Ha63FQx2ujL+BXUuBi5Q0Z6MG3brs9QB/MkSMOvlHbR5sQs?=
 =?us-ascii?Q?FYRjVvU16Weo9hMJR858PaBMSxKw+pzJXIWFQmVKFzZyHm/hJV8yOuaOE7u7?=
 =?us-ascii?Q?2OAuyxY6bn4v8p9YO+e0yKp1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2289de7d-7c3c-45f2-81e3-08d94769c162
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 08:22:59.2791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUo843hi5MVyvVJawPpHDJuUmrjSZC7UXrludIbNRSsqzB0wiUbDWF8b+yQl17BkRDVx6+TARzqjNjNmOk+yNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_012306_420201_7C8E4A38 
X-CRM114-Status: GOOD (  13.21  )
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

Hi,

I am using SVC I3C module recently. I fix some problems and also have a
question.

My question is:
Can I3C bus support pure I2C mode in kernel?
Or in other words, in mixed mode, must there be at least one I3C device on
the I3C bus?

The pure I3C mode works fine. But when only have one I2C device on the
I3C bus, the probe in function i3c_master_bus_init() will go error. Because
there is no one on I3C bus can ACK the I3C message with I3C message speed. Then
it will return error at function i3c_master_rstdaa_locked() because of no ACK
for 0x7e start byte.
When I use the following dtb configuration, the above problem occurs.
&i3c2 {
	#address-cells = <3>;
	#size-cells = <0>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_i3c2>;
	i2c-scl-hz = <400000>;
	status = "okay";

	lsm6dso_i2c: imu@6a {
		compatible = "st,lsm6dso";
		reg = <0x6a 0x0 0x50>;
	};
};

But I saw a similar configuration example in
/home/nxf47749/work/kernel/i3c/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt.
I wonder if that can work normally?

I know the definition in the specification is:
Mixed xxx Bus: I3C Bus topology with both I2C and I3C Devices present
on the I3C Bus...
But I think it is feasible to use pure I2C mode with I3C module.
I am not sure why the use of pure I2C mode is restricted in the software.

If there are errors in my ideas, please correct me in time. Thank you all.

Here are the fixes.

Clark Wang (4):
  i3c: master: svc: move module reset behind clk enable
  i3c: master: svc: fix atomic issue
  i3c: master: svc: add support for slave to stop returning data
  i3c: master: svc: set ODSTOP to let I2C device see the STOP signal

 drivers/i3c/master/svc-i3c-master.c | 45 +++++++++++++++++++----------
 1 file changed, 30 insertions(+), 15 deletions(-)

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
