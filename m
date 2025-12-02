Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EB9CFD376
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW6l93uMAr0KzeaRjg8PjfRUuBYds1IxOPfZsJY1VCo=; b=mUC4WfIfttp5I8
	KShANBi4EAF5BQ/BL9KjTyc6hzljX0bf1uT9vAwqVPMgKbXLqsIsBj2TUoG1Yavvc04/m8A+Y7E7z
	54CDbppgdMlgS8OjA8BXVTLkGeIcKbBRWp5ldzeszRHkTiMZDu+No2LvHdjqqhzX3VhLYtmeGGcg8
	aut0Jc82PKrh4t1/1zdZO4Df94N8m7D9EygBU5voClqDFvIRHZVYSQ2Wv8uP4EVpysGU1jAvnwUyC
	AK/QkIBLUpfV3NBklyL+kUG2yzo9WxwRas1sG5uF39HTxqdT7Xc8QG3TBMxDf1uChgQtR4NLOF4nm
	Vh6I24LYJ3KiA7xhMhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkp-0000000535F-0v6X;
	Tue, 02 Dec 2025 08:28:59 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLkn-0000000533v-0T24
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 08:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mngJnUpjF5QLlO4UvCDVE9Ja9+HtRdac5DTrLhKOUokYmruTagXBikr1LLfvJvb9PZ4xWpiiglgKyVqHkyYla2md8CcmcqxhrlfOp3FlGdFj/0JV6pnK7Mb/bWe9Yeco16WKrxAAATskPld8ZhJngZElvmC4Y5NaWLp/OmB19G8Yyolz0afCQKjs65d2ZBZF5tR2l9c6rx0umTdScTszm+C+vbCkkH2aycIjxM+n8M7ry8B13gKR2wY876ZpASbFtD8BqRfZ8ByaZ4Cm9PisrAA8TfDpuDxzxG8eP/y3hOba9bJZ1TSj5YKhqx5CzyCLkBJ3oorbZNobdJSh6CvP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bxq8xwkIAVX23cbMTEGuBBSqklx9JND1EE7bJyObIMs=;
 b=tUGjEOUeJ+2Gvf47t6zgzzSfJwTnzX+wS6P4kg3w8n3nmYgbea6eTQ113ZA4NU4l54SIxe7Aw6sIYIQXI2SRXpaZb3B/mmo6rgjHzCLW3F8FGuWciZlfQ1rQ+N53xfTOE8uhMhPdEqHpf/sf+OFj/xD9YX9FnvJPqdSRh2a1PCn71JcEQwRzWwaHm+atpDWUmVZ54o9hAeSiIaW4EJFmAQx69L7dZPhudi5HPLU/7+20A4h9miGdzAxpWrNeZqBcIyqDlggW+xytkVZl2zqrcUQSSJCdIMlo+1M9MOjLmkZMmgmU9l167jekn4JjalZUbcLYJB2zhn3l4DGmAZ/p8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bxq8xwkIAVX23cbMTEGuBBSqklx9JND1EE7bJyObIMs=;
 b=vtNJZN49R0iSy4CcrmNZObSnfNJaDXbPeBAG3UfllI32e7cKio8/j62F2+5XH4NYIs7Y/lU3GFg+wNopnzkaaXM+RebKx7OkLPWRkvLKL7U3K2pm8s8oA3zI4u4iqrcpTmncFnlcgup0zCSHOgROiJmp6IkMqUX01+03Vazbc7sxV+VQco4p6n/lEAtLG25z6Pk6i9V5Sa8Ety6V3zH3jGTv+6843r2rX+PEEN8maB/bMo+7wLZZtb4VfLmePXooVof9ewCX30GYYD99dE4D0stF/w3PTqF5Bthe6ZuP6q0TWOX1Zz986iHU+6YP7bqHaNc9KsaXOJzjcyKdxiEESw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 MW4PR03MB6459.namprd03.prod.outlook.com (2603:10b6:303:122::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:28:45 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:28:45 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v5 2/5] i3c: add sysfs attribute for device NACK retry
Date: Tue,  2 Dec 2025 16:26:10 +0800
Message-ID: <c9b283039b066455e688f5d59d0a46b5d286657b.1764663888.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1764663888.git.adrianhoyin.ng@altera.com>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: KL1PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:820:f::17) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|MW4PR03MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: e323e2ee-5217-4ec2-4bd1-08de317ccf4c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q5Ly8pShNclTw58eumrrqGjTlFgoGs0pCe13LGuVzuYcYM9xLWd27ZIVVF0N?=
 =?us-ascii?Q?cvhTO0SweHcJLCIU2NSqUSRbD0a1ifgdcjEXdfbq+R3knx5YLAd7AmHneED0?=
 =?us-ascii?Q?Qj3sRjf/tv2EcgQao/O6hGRxDygjT9nl33VCO+lYxxD8tkMqWRojWqvo+MOH?=
 =?us-ascii?Q?MU27mPGAjPr9t4LZQvqe+7oUoSSZjDT9V8q/2SziXVEshwN64eiLgBpGjrvt?=
 =?us-ascii?Q?+BNiSlnCsAGNEjaDN4vK1HIyWf3FHu6JMzYdrmFFlRYyp2ALnH0n7R/UnYHI?=
 =?us-ascii?Q?qDJ6o9FBWJB3TRgEJ4N0yaGXzJR0gReufYQclb4s7Q57x/XkQA4dRLRrOeJL?=
 =?us-ascii?Q?uc6xM1ZCrGX/yvP/3IMyq2E8ZWxJoZg8i8XDSDrqA0l6CSLPAwpKyqncFBDP?=
 =?us-ascii?Q?4AR0ZyYSnnPYA8rA3HCqV0Zmo8bVwyuk8peQ/hS0CMP86SHTH0UFcIxwyGTO?=
 =?us-ascii?Q?ongQQeNxv6ogCgjlnbNJi+Y0OGsiWwc1YreXg33uWoA8N5YOJwOXeY3EHa5s?=
 =?us-ascii?Q?XHW/FLU+atgbSLKc95iILWd6YrvHL/hD6ijg3CjyATdMjmX47j3RHPq3D3V4?=
 =?us-ascii?Q?ndiJaucjjRv3+oxLNLYBEpCFz5khA4fryAMJLkhSzfC8BVowPhYOXrUIbGbb?=
 =?us-ascii?Q?liHwnHiWu9JnL9zskALZb2QWpqcRNy3qitp9Vroqmo6Zabx2lyJ89Csmq0pl?=
 =?us-ascii?Q?MiAGYhhN0V7/WNlZHCJog2/auPqzT+AanmK7RJi505dED+hv2fZOA3tqKAME?=
 =?us-ascii?Q?2J6+axB07tWDVZyVJJmX4wdUVpFFmYwg+WOjE40AQt7i0a7teYq5S6fIsPZV?=
 =?us-ascii?Q?6z4sh/al6fN5Q9rdufVMbb63PxHTmegEbCv1yhskCTRSzxXlpo6JiLIySEbr?=
 =?us-ascii?Q?p9oQQmcY0/3jfw0U5WcmDj+9eQdQmTqo25an6i5505HQc6wQ6Zt13TSrxXPJ?=
 =?us-ascii?Q?taWuEXJkJhOdfMDPkknj/Eeu4o9OK7U6oGnITeANC9RNGwkeW91DkTQkcXmQ?=
 =?us-ascii?Q?fzvYHnQFnBQiSSaFP6FWlQqne5ymWwjDBfzS/vTKVruMYYcJnQC0W5zcgTIV?=
 =?us-ascii?Q?xnapvd83Wszaf2MOi9BCoRZxXftNL2VYKjNP+TDrM0MULhMv4Lc/RvmJNIWu?=
 =?us-ascii?Q?4I5E9LApQIjAFK8Ovj+sW7UfG3EbQ8TbEIXLrjzFYsdQqCdJhBwzuRW8wK3Y?=
 =?us-ascii?Q?Zm2mZLIErV7H1DqMWw/N9jK8leOPwv5AZIVX0U1UnvAS5h9U5WkfKQrKQqpW?=
 =?us-ascii?Q?3qVKuXaGMf5MWMZgCp783OYLTFfvRY10/XUu7lV87nsa4nPn+holWv24o71B?=
 =?us-ascii?Q?riXBLsTLKy+FZg2HMizDEodiZntPtD4X9V3yN10cCXRWVMaidDtccZhVovl/?=
 =?us-ascii?Q?jENyUJ2h/7Dh1hDmjHdFz3HzoxkhAtyY0RNzUpOLx7m9+d1cH9J02OxkPR/P?=
 =?us-ascii?Q?Gk4VV+9gi+Pdw6I3h5aXwUTX9ytTgalo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dyRcOEPsFuHjCF/7xlOaHQ2MU/hwShm4JpirZWGam3UoTlqIEfQdukHAOYMZ?=
 =?us-ascii?Q?V5mrTwB8N67p8nghruZRQ1dPwWApyi7ChSFPA4hPd05vP83FrcZmvgmCG2O/?=
 =?us-ascii?Q?irNs7IM06Zxi5mYPAX1YDsAU5jt543v/ZAxjMx1XAFDtepy1iGhF2XwUlIQN?=
 =?us-ascii?Q?uaTv7KkGcChAIBp/jC9oiYnHO+dJJmBlHc65CLhkUSjBhwvkekUKhkmsEZIO?=
 =?us-ascii?Q?wSD8soe26P+sF/WuJ3FAT3gx3c5KAR+TgFvFYBMkbPm1lNAG8PV1j+Xpb3jG?=
 =?us-ascii?Q?URH7hKnLmXX0C3XbPv3KLvZ7YppkDwuxOwlkMab9/BiAmqnnP84SrZRyIrBL?=
 =?us-ascii?Q?gmOxQW2+jx2aiESQAYUqqZuopAz4xwBtRlM3pOV3ZMGaUf3AjI8VsV5PdfaF?=
 =?us-ascii?Q?ENXXro8bBHaN5zK39d6+tCMcHMC6LZ3ZsDcTdwEZqn7Cvm1fFF+r1Tk0dmDl?=
 =?us-ascii?Q?EKsmzA3Ik/hOAFh8DfOOBKApjSUnU1S2SHioA886qPCXWcuyNpOGRGYMa35/?=
 =?us-ascii?Q?/bbFkwews2tRJSl22gaJ1rmYpVzShJf6kJDAniscv0CaWo8bTNZK59tBIz10?=
 =?us-ascii?Q?gbRuHp2Bn2ZnactLuwO7xyM46U4QpVZFJcbAygdkwfcCqipUI83/0f6IxxT5?=
 =?us-ascii?Q?NCV99aquXrRxgDAuDF/ppafme9NtSgvNsl2lrw1A+d0UMEPBoTCAT+QaBeZo?=
 =?us-ascii?Q?sTt+o5Vu3g1AQshWKJYqAEnyLdzpEdOjkjDIDy1BmNwmJfyp7UtAvpZYj0Lu?=
 =?us-ascii?Q?rgu922UEvphQWc6sDwcTBvXH8e1gsds/Kf2LiVjs/ACWQjefWInhFEmR79/d?=
 =?us-ascii?Q?4fBKqHd1odYRzd51LwQyaaOzgW51pzQGgiyrNZ0lICGOcesJxD9UCeRbiqkP?=
 =?us-ascii?Q?9FDmFbwKCrLprq0mdB8PB7YIujFdZYaEJEmJ18CTIbPr82PthyTUbGw0NINm?=
 =?us-ascii?Q?qJnAvYkfEpPKEvdsphoLxOwKJPN1v1vH6hIKpJIsTYUBNN6DIMF9cNbZEBWp?=
 =?us-ascii?Q?ZDcHKnUJ1zbE4EAlRk6H/jYBWevpxnA6cS2Fo8DI5MhDpuXfEmxayIsgFBht?=
 =?us-ascii?Q?3+HKjWyGoMM05RRKiWWf/0PAGqAqwMLq0ChoJVvps334AyN8nykm/X9+Xhjr?=
 =?us-ascii?Q?qvYFjZ7SZbeOw6tvkJ56YVRDFMHICAaHWQnsu6M1WQjfbxwBhlDi+ELb2UhB?=
 =?us-ascii?Q?5qXY6CanDmcijxBQLjl7wEeWcYaQBUoTjus0Zm+7+fwGMW85eyH5oqSngprz?=
 =?us-ascii?Q?RmpNanku0JngtrrwBFw0BGQsHGm+0+uc74myKpkdEExCxHGBqBrizgNZCjLz?=
 =?us-ascii?Q?KdXO7j2uNynUTCbZ23ZtjeSXV60dQSk7ORyPa6vtcUQuQpFBYpZ6JTCdkLIP?=
 =?us-ascii?Q?gF+JzLJRsY0/ckl0LycDW8C6HQKNnmUkebsVxWD8sJWsxqMPMoWFvU/FDyZU?=
 =?us-ascii?Q?qN9l5igKBgJdKPs2KYR/0ZgYXNUPKpBMTcMnQcNHbp30cCTpuKPis7DW1Ne2?=
 =?us-ascii?Q?w1+X1rmVoMDibHFXlZH6PEWAVKlfUAB20TjrG++QI+jig2tQ4qDG1mnOFOEY?=
 =?us-ascii?Q?5BBeheCPLVfoeaAsePhhiRBohXYhIEvxQ+uYyyGXrjCaur3ArS8fOjvi0Uc4?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e323e2ee-5217-4ec2-4bd1-08de317ccf4c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:28:45.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unJptrxd4y56cCmCBSZz72exPpHkODplHw1wVyCYvZf6n9eOLjMC2kP7+WuwW5+iZndazTS9mZNxruOAs4XltuhQ+NKu/bivUc1626sEikc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_002857_157333_C2B8EFCF 
X-CRM114-Status: GOOD (  11.21  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add a `dev_nack_retry` sysfs attribute to allow reading and updating the
device NACK retry count. A new `dev_nack_retry` field and an optional
`set_dev_nack_retry()` callback are added to i3c_master_controller.
The attribute is created only when the callback is implemented.

Updates are applied under the I3C bus maintenance lock to ensure safe
hardware reconfiguration.

Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
---
 drivers/i3c/master.c       | 44 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/master.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d946db75df70..ab630c77b3c2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -685,6 +685,44 @@ static ssize_t hotjoin_show(struct device *dev, struct device_attribute *da, cha
 
 static DEVICE_ATTR_RW(hotjoin);
 
+static ssize_t dev_nack_retry_show(struct device *dev, struct device_attribute *attr,
+				   char *buf)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+
+	return sysfs_emit(buf, "%u\n", i3cbus->cur_master->common.master->dev_nack_retry);
+}
+
+static ssize_t dev_nack_retry_store(struct device *dev, struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
+	struct i3c_master_controller *master;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	master = i3cbus->cur_master->common.master;
+
+	if (i3cbus->cur_master->common.master->ops->set_dev_nack_retry) {
+		master->dev_nack_retry = val;
+
+		i3c_bus_maintenance_lock(i3cbus);
+		ret = master->ops->set_dev_nack_retry(master);
+		i3c_bus_maintenance_unlock(i3cbus);
+	}
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(dev_nack_retry);
+
 static struct attribute *i3c_masterdev_attrs[] = {
 	&dev_attr_mode.attr,
 	&dev_attr_current_master.attr,
@@ -2962,6 +3000,9 @@ int i3c_master_register(struct i3c_master_controller *master,
 	i3c_master_register_new_i3c_devs(master);
 	i3c_bus_normaluse_unlock(&master->bus);
 
+	if (master->ops->set_dev_nack_retry)
+		device_create_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	return 0;
 
 err_del_dev:
@@ -2987,6 +3028,9 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 {
 	i3c_bus_notify(&master->bus, I3C_NOTIFY_BUS_REMOVE);
 
+	if (master->ops->set_dev_nack_retry)
+		device_remove_file(&master->dev, &dev_attr_dev_nack_retry);
+
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c52a82dd79a6..ccbc9a14bd6e 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -491,6 +491,7 @@ struct i3c_master_controller_ops {
 	int (*enable_hotjoin)(struct i3c_master_controller *master);
 	int (*disable_hotjoin)(struct i3c_master_controller *master);
 	int (*set_speed)(struct i3c_master_controller *master, enum i3c_open_drain_speed speed);
+	int (*set_dev_nack_retry)(struct i3c_master_controller *master);
 };
 
 /**
@@ -534,6 +535,7 @@ struct i3c_master_controller {
 	} boardinfo;
 	struct i3c_bus bus;
 	struct workqueue_struct *wq;
+	unsigned int dev_nack_retry;
 };
 
 /**
-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
