Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE40D19512
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Jan 2026 02:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=saQdIPWVpIAvipd/NNmZn1s+o5aK2hOwohQxv7YylxM=; b=VQDLmqQ+oeCFhA
	ETb4FZI2gNpPF4s8w/7NBzeRa3vmboFu/OQqYPtH10cqamCCpm83qZQp31ftmlg4Ju28yaRUUs7dL
	nIeQkfhk9BFfLdNgciXLWpIHy0/ISpxI66RPYEwIo7vEJvzo3OGcUDV1rQ/BXwr2BjJdNyw4Uj4qK
	j9FP2iXwCTnVFs/sbWxuMXkjYXowVPsDa59M55NFL2l6WEg8zC8qkWlrfYHs/H2grpQwFFTTl0t9b
	GMBetrl0aJ8QQpBQb8Y7eWyWsT7HQD14SMubfVCl3F9bN9azLXo2gPxz7V1QReY97FOdimZp6jwOg
	7/hzvh5I1+ctWe6zrB+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV6-0000000DTBt-0Erq;
	Tue, 27 Jan 2026 02:08:16 +0000
Received: from mail-eastus2azon11010037.outbound.protection.outlook.com ([52.101.56.37] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYV2-0000000DTBG-3nRU
	for linux-i3c@lists.infradead.org;
	Tue, 27 Jan 2026 02:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpBxMnlPGqtErxUVYPawQszW2kV4hYcPzh+6FxwQ2jfgdbICyg/jycFHtowe8d7TSCOHWidDKiMWrcI5yH6vBon7ddp0QZWtJezQTC8W9ptlopF481oenJgyRjYXewgNeUHqB829IbjqNYXpLuVyqxVwDFuIsTq3ZTjLE5k9AaCJFleirmrY7nIBr3swDrGkXK9datrBZuywWG3+Tc1kI2r6bFbT/QjNIC54XuRarwMZHi3UinSJ6+Wf5YnSPhgYS+8S67KquYUXX6POx1NAjlXFRTmW43z4d5FOTkfZbKeEygiDW4GspwCe2zEGFVrA1QgQ3pROo2+RmPbonfx3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgeK6pFhAxGNkjKqY0TLINZpbOaiZ7uYeLPf19sndts=;
 b=gtyiB73ryMHpb+U/raz2ZxDGqhbicDjPdogGtSR2Th0B6rZgHg9haqMwZUgtFzy0GEezQlJ5T3LbDeRvqo9AmEMyOFe8q7ilkyJ39ntr2l2UvN5MsyzoRLQ+gNpJxYHZLDJEc0MaUbcwdYXcFDWgyFO7HAKGEiccWAFdNAI6iIF52PANwENuwSo8RZpGo8uI2cF1GfUBn5FCqsrkF8s+EPOfxGsBdow1GaOVzmkGdAD/OjwLO5la6MpSvyl7JrCvcPe0k4GfmefwTRhTm/AF0s9ju6tue5oJEWsRwrt4J7h3cxgxiKQhMQxvH7XOqprWYarCxflyjWsTwwW4lo46dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgeK6pFhAxGNkjKqY0TLINZpbOaiZ7uYeLPf19sndts=;
 b=kK3cSEf4oEq5asJ3vd6cvFR4HpCWAyZh47l3gVWg1Nt4crFysQVEtRDrm47laS7KGTLR67UqU0P8QQms9xZBRiIZLeBVctExopIGksq+5A6rjKtFCLFj2QL0QbP+ebKvcgpUhlG6oiWqcg7WlQUl8nPGLytH9padGV+ZU5KawE6G98C2sPAw2OHfKj7g8XIDhUP/HY/gShmlaIdEbVRXFghn58I0pMWvMWA7DC/7NsaRMxeBk8ahhYVo9HOKqfXUzHbVOVqGD/8KJ2plgR4jRuM1fkvLllMG66mD+qogRi9hJqz2VIgACK+ig5XLkulVk3/STlewIub6+7X7gIDy6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BY5PR03MB5218.namprd03.prod.outlook.com (2603:10b6:a03:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 27 Jan
 2026 02:08:07 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 02:08:07 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v4 0/2] i3c: dw-i3c-master: scoped spinlock guards and SIR reject fix
Date: Tue, 27 Jan 2026 10:05:05 +0800
Message-ID: <cover.1769479330.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BY5PR03MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 86aa0fbc-259f-49c6-7fff-08de5d48e95b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gVOfUm963Gw0nvfvG+1rMV621/YVgh8auH09ktsC5G2BWnx/nMpgj/fQPyfr?=
 =?us-ascii?Q?J58g8GIXyUvDcWSG8xr+ylomcTIFJhKcVhKAgaLyO+ezH+yz0o3IjMZMRAuo?=
 =?us-ascii?Q?IGahdaLsOFcneNmOQfmPMFqgvcVYmnSiEUzPiNGAhhgN4SWMUs+F7F2hxAeJ?=
 =?us-ascii?Q?yQQTasCIGhbcdX6OxIbLhPGINjBPSUG5z9NLIz8XE6Tv1sVeiyfJM/P8i70J?=
 =?us-ascii?Q?87hZcZQ1I8xSv+XqZtxaz8YmexVGQXRYtWl9q/jMGGqw6SaeoxjF9xKTW/tv?=
 =?us-ascii?Q?hz+J516jOe6x6/hwod+Xzv/tweak//+5VJu0ZS/j7q5Zl2Dm+Z/gTj62Bwx4?=
 =?us-ascii?Q?0adoXqqNDxRCB412poMhWxYFRVjmhJdSBe26OXKUQJEPz6Ec/5XlIEHNYEpv?=
 =?us-ascii?Q?/f4Xcrqyf+D5JHLkf3FwB09WtisyPFHYerA5g2ei7xhaK7/pxV+QcGrlinSH?=
 =?us-ascii?Q?i5G+NCShxScj/71JrXpbUAfMU3HE0xBROZIDcLodE+9AjJNZIooBwj6is36E?=
 =?us-ascii?Q?gISUuq587n3kM1tc3HOoj2ER1eMKfRnSfyO9lDO1r+sDqQRPQ2KcVdHuuDbA?=
 =?us-ascii?Q?uf/6Qgrif6UZNIiP/4seKXTpwsT/liEjwPY7n1Pt+F5G23dv3DRG3yLHceDZ?=
 =?us-ascii?Q?cjVRkdKWjV53/B6swhuctlzQOfJsOFZUyi+d+gw4TCUp/xX8G0OJgOjHVLHv?=
 =?us-ascii?Q?I7pgvcRLSTerpL40Ws1a9TIv+BoLHt0fojpK69yGnNlc3tHYezCwHsd3wDUQ?=
 =?us-ascii?Q?pUgcUXlT2TgzViwuJN7a9/y/VxO+kK4SVPGJyq6o6Xj7MT8qbo+YHW45alhX?=
 =?us-ascii?Q?4eHNBe6eu6P34vviCaPApMuTtXY8cAzDZc1IAhL37bQmYFNw6r8OAYPa4WDT?=
 =?us-ascii?Q?Nhi/aDfEW2GumEyKq7m0/fCe8ZNAk1Q2HI/E+AiAiZz1s+jm3Rkvj44xcmSR?=
 =?us-ascii?Q?yGPSHU3eIdbNGyTWEoVOgIHoV7ydUjTDyGoobb33XB1LxJHtoR+US0GV99Dz?=
 =?us-ascii?Q?ws0K4krqaVMMt2PAX0wQ9f1CqVkKmcc195XyUAJaraDU0MSrrc5gVKjKtFZn?=
 =?us-ascii?Q?Ol+IF58T+McnYZE3e/Uj6RtG1tXEN3jyt+j5Lm2gSZhYLFQajbk07O2aTKha?=
 =?us-ascii?Q?E8BsmFf2bzVBLfcg2rt8Xj3342i2UEGtWbgfjyIHfUGuqHavRoMgK1k9z5x4?=
 =?us-ascii?Q?Nie1lLBWPmCiBRVGw48rlKpDy+90/2CNm93BXzY4WWyFnLiS6rds7J5F0jmE?=
 =?us-ascii?Q?dW7q8PNLevjvtotqfnKqqESLtKdsQSqnpeHGY2y3+arZpUy+n6jQtK99SxTo?=
 =?us-ascii?Q?LA6ukQ4pj0/zC2PqmMl88andPc4K2hhVk7njOElY7dlZnzwBS0uViiMX27p2?=
 =?us-ascii?Q?OVFNfKDo+y7gRD0dyAreNr0Zp7fVWDoxiNZyX1WnviFfb1mNiwdcsnjlMbar?=
 =?us-ascii?Q?HgOkGvgIch4CY5igtSSQrZ435bZvokRAux8t+wufA/vTmWX1FK6rNdp1FN/w?=
 =?us-ascii?Q?U672eKpbyVltFi1aB3GBOPfw3siMi3F49tvh4atFwFG3repJ4lvoC3g0MDxi?=
 =?us-ascii?Q?ULCJvqUqWLk4BWFHDF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dycPUpWgJF6y+6fjak/nBchYFcqRSCcGkFh8/Az8fWnIrSb24Z+Ci/CllkBQ?=
 =?us-ascii?Q?0TbTzJheCX5feAS0c1YmmnHPO/ZmB6r5ECLU4EMiARUjwVqK5ndkmaDXSP3P?=
 =?us-ascii?Q?J3zsom82GaXYPrNjQHJA9nDUFG4dihDjTSMnqNnrSn+tT1kdOC0t2eC/qLNd?=
 =?us-ascii?Q?o95C2O7vBFs2Disw2GmqV7euokvI9pIKsm5Z+vPBOoOP7e4pXKLXgkUgGt4g?=
 =?us-ascii?Q?7Wz5odfpDjd502VVnP9RgfqbD1P6N6vybwP5i/SBZT+d4gNYb+sQpJwOgMfw?=
 =?us-ascii?Q?/nVjdE7Ku25wZ64SRLp29X7HZdVajYenyPMqjQmDy+vvCU0ISMEZejTMEzjF?=
 =?us-ascii?Q?76s4eKlu6gD+kAKLw6gUqRIRrMIyOVgGmuNtJeo2L5j8LYORBT3eNUg06FkG?=
 =?us-ascii?Q?+I3Zc/ZsemKw4NZOTfDCMB7JfNsddvpq33thEHC2hZOqJHftAjdPpYRVClBV?=
 =?us-ascii?Q?rO5DXx2SO3DCfeKdPdyNid+pTUVnwxCwLQUQaNp0Oq9Ib7byGLEpJSRvi70f?=
 =?us-ascii?Q?zk3mrW4vKm3PyP5zp2SEd9/EcmIaWBQJ1ouWXzzvSTQtBybvqaS+0Hd/owGp?=
 =?us-ascii?Q?pzUWJPJE92HV8ZpTVEezl1KznqiWIS/U9clSUk2oZxqe1xI9J0IHuYijXvLn?=
 =?us-ascii?Q?cHWpAmMWONvAJx+w3xUaXq5OnD82gK73pqFV/R7S7UtWhMx6e4DcVdgqhAuU?=
 =?us-ascii?Q?E/1s0hfYf5ZTTQo1p/JWNdgzgSlWgwICouOIMgTFK6KtkGVxPfsT9xBgttj8?=
 =?us-ascii?Q?B7Xl42BBEUQSGENCfQDLCc5DSU/xRxWUqI10B675FruKWXdYqy7wsMzUFIVP?=
 =?us-ascii?Q?VzHSd4WBs249Dqt+Oa9mR8X+h3IuSMpV3KQJDqmNQMYx80SN7FzRM0jnAMK7?=
 =?us-ascii?Q?1bm6IZlRwtb8sq7x9NnrB3DPsgoxCvRyomurr1VxHZ5c9kwJAuKX6NVltI6Q?=
 =?us-ascii?Q?OaKV3n6O74pOw06BA6vKxIppD2UZWsnvgCAiskEmsZQ2Nha5IOGLol2kxkff?=
 =?us-ascii?Q?ssQXdX+8aAbTyV6+p1GvEoshE+4ZL34shJcKbFhiXWSvtPSdDBQ9QZyCsINC?=
 =?us-ascii?Q?4De1swSo2tJLGo4aHkMQXjboP+hB13hd81JwHaCDr9Ur7V3Eymu6+fl9cdI4?=
 =?us-ascii?Q?ZF+vYTc7AGrBKTbhJzLiAdneTu+J9Q6m8BgSrF9bkwjD17VDwqzFOkLaUWDi?=
 =?us-ascii?Q?cTkGqbC6Eh9eRfsTWxkiyMoDhLXLwOGWJ9Me1xDozfUMLQMf7UZdFAdrrOTH?=
 =?us-ascii?Q?nyRuZsrav+/LBxVPpZ+0qy7EnmXEeZ8r1OQ79f6lY6pjrQC7r4taSWKQJuQq?=
 =?us-ascii?Q?EHyYxFH5wcJ+wT1da3yoKhsZgTTy14hOxoZsnj8GR73l4wzkAd76VWc4YKjZ?=
 =?us-ascii?Q?Cpopf5puOp8j635mh85e2ZOlA/NX32Z4VrE1m6KfGCqwbsFkNoHCP6gVxEgZ?=
 =?us-ascii?Q?W/3XNxBICcquLsUi7fZYgjCJZDDIQkUmXW3z+4Meb9/umNc/a0qimUKqzY6Y?=
 =?us-ascii?Q?s5oXo+j6uzh7Wbnvt9oDk1az1GgHWIZEIPkTTX3OAZkukXoO8GLvouZah0Vl?=
 =?us-ascii?Q?iNEG+2Ks5XEN0WBNKvmcXRnm1S7ZBdKRtRmPODQ4jurastYDXxhqXH8Pyj26?=
 =?us-ascii?Q?NBeiHw1O0Ho/LTmNpe6Dj7vlgZfj/i7ToCu+lN7WMZCYuwNosNUu6XIk9mis?=
 =?us-ascii?Q?A+D7qliTKRYjMj9aMGJAAbCWkcwuO5r03Wi0Zxra2JVrR4LWnHwvsEiNzSsD?=
 =?us-ascii?Q?iMRRP2FcOizLxIdNzGO9aIkdAtDi90w=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aa0fbc-259f-49c6-7fff-08de5d48e95b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 02:08:07.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2xmt1HMa6TkjQF4EjNA9TLIZhsmeaN2sU5IXD6VtQwL2JR2f93YMRd2g5hl+mEtFwjiGpnqJlbmzL7+YJJctq+McmYcr3ukzWfbF6mgKxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_180812_980516_81EF4DBF 
X-CRM114-Status: UNSURE (   8.00  )
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patchset replaces open-coded spin_lock_irqsave()/spin_unlock_irqrestore()
pairs with scoped spinlock guards to reduce boilerplate and ensure correct
lock release on scope exit.

In a subsequent patch it fixes the SIR reject bit mapping used for IBI
handling. The IBI_SIR_REQ_REJECT register is indexed by a folded form of
the 7-bit dynamic address, but the driver currently uses the device table
index. This can result in IBIs being rejected or accepted for the wrong
device. The patch derives the bit index directly from the dynamic address
as defined by the controller.

---
changelog
v3->v4:
- Dropped unused DYN_ADDR_LO_BITS definition.

v2->v3:
- Update guard function call in dw_i3c_master_free_ibi to use scoped_guard to avoid
  i3c_generic_ibi_free_pool happening under spinlock.
- Update get_ibi_sir_bit_index to use FIELD_GET and drop DYN_ADDR_LO_BITS definition.

v1->v2:
- Add implementation to use scoped spinlock guards to ensure correct lock release.
- Update remove DYN_ADDR_HI_BITS macro definition and update MASK to use index directly.
---

Adrian Ng Ho Yin (2):
  i3c: dw-i3c-master: convert spinlock usage to scoped guards
  i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses

 drivers/i3c/master/dw-i3c-master.c | 59 ++++++++++++++++--------------
 1 file changed, 31 insertions(+), 28 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
