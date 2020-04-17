Return-Path: <SRS0=3SkL=6B=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BC8C352BE
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2020 16:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29032072D
	for <linux-i3c@archiver.kernel.org>; Fri, 17 Apr 2020 16:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R4poSs6t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="a7EFYI3R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="RR8aeFVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29032072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cl40HC1cIiV5q/5FTwUfB2C5TBytOoABNNyYj91cxSk=; b=R4poSs6t+H1Z8A
	APXT5KowqDBqaVPXiVk3wYoauFcucjQLByK1eCgEoSQHcwXgG0m2mOHfAXTp3Ee2kXGiXR3kEa5oI
	ofSdRH5Tzi+vJrH/wyQy5i6NJzMajmTv03VXP+Si7KhY+MC2NdLcEj+0eGV5+rBZ1/bQumyc8ZVY1
	c6Of/lnIxspzA9fpfJJLtxiR268RCq8DEw9+6G7KRA3FOsCB3O6uP/pNOJr3GdIepBU02B4EAxMsC
	oI1Q/x7+v1kGWjW0je9IOLO6DqyzhwuqP3NN2e3E5eVxNFh8AOK/bKTbkWpafBZWN3nHSNcCgLsNH
	SMll95lXulT3EwFtHZ+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPTl9-0006YN-6B; Fri, 17 Apr 2020 16:22:31 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPTl6-0006Xb-M0
 for linux-i3c@lists.infradead.org; Fri, 17 Apr 2020 16:22:29 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HG8SGo005877; Fri, 17 Apr 2020 09:22:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=bGTgtVwevNe4bxwB8uzvLNMFOuiy0wbR2frhEdzmslw=;
 b=a7EFYI3R4YxSdX7Bhdhy73mcd69ZabKD35QcXKGklrzWqPU5D3xIrE+e+oVSEbyI98DH
 bmMWdPwiPzckoWH9/va3B7zCPajxciUl0H9zij786vgs6QJIv70YWX9oLEd9MOg0Gbyk
 scH0uteI6Zm4XPWcPIFjJGcP5Hj6NqY3Fc9+6W+8LTQry2DQ6axLpvEDBiDfcqtppY3g
 HFooTa6wSVtXwI440gTSOq5qCPwqIn3xnZESygjp2CMFKT2KwIcfYPeiFGu6kxeqkNLC
 LKcHCNIfGeMayL8rS0Jij+cL0SuqnO2I307QyMXYLLnSnxvFcGXLCSUXtsiSj/R4yoNr lA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by mx0a-0014ca01.pphosted.com with ESMTP id 30dn9650jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 09:22:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4pDVnyZpbb2vulWK5Q6OA5LgWn6v8KGLNSBDm3geLm7ByhsyB8C5LPYU3JuEJL0wsL8smR0rK9h34W2YLAgJiBvLHGy6XxyxqXV7mW7VuqBm3XwaFofgyQ5q952VR2NZos/ircj2g7JmXdGX5y8B3ITk0sus2640eXT64K7lfEwo2QQvoSPNHbDoB4+1aWmb7K3qEHcGcATTCP5Kc8G/1Ibda9N/qWzVFqsFvZ7+tPX/9JkhA+B4vn6TT1TWhij3lMLoHhJBbij9npXKztpH6wt6VDQUEu3n1caYmm581hw7fd08NbFscSmmG4GNZqbJzIdDd1QKqi6lmNTJGOotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGTgtVwevNe4bxwB8uzvLNMFOuiy0wbR2frhEdzmslw=;
 b=LWP5uBvzbWKWFizQmivURl4H4mZW5NwR47sMLinFoHGUOuzolABrzgpALN0+8vp7wYYi4ynW62cI09YJ8Fy/DHjc9KZwEW/vEmJr94/NQ6DYodmS1azzKpJefXO1eAqmufYcClv2/KltO97XKdaBxIELH8FLDg+v1L4Ucf+XcuHWQKvyhVC4YeR3BlY5EcBk4WhV15foaxJVhC8fE22x8gGj+ZbUNOOTGtgVggJXwSzRIhQ84SfDwUuaaqX9QgYesIv7wCOweaE0bs17bi87l/VroVFJyXVsYmPj10PW2M0nhMqnj/2vvhBUarAOme7eV1NztDpEmQYnG6lWtORh0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.23) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGTgtVwevNe4bxwB8uzvLNMFOuiy0wbR2frhEdzmslw=;
 b=RR8aeFVS0k4nxhr1pwP1MNbAyrcIswxS4Oidqyl6RDeJ6U0HYzOnu1UemcZdlvWslmIMRe61oLRfMU/Lj/W77FlOYky+T1xLN6+JlhJixadOh8P5aDoHKbldVv5BNDcB1Eq4OoV9FsMeA48HJTX53WDyiEEgRllVnTwJ9ScQCnM=
Received: from DM5PR15CA0068.namprd15.prod.outlook.com (2603:10b6:3:ae::30) by
 SN6PR07MB5695.namprd07.prod.outlook.com (2603:10b6:805:e2::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.24; Fri, 17 Apr 2020 16:22:24 +0000
Received: from DM6NAM12FT016.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::1c) by DM5PR15CA0068.outlook.office365.com
 (2603:10b6:3:ae::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Fri, 17 Apr 2020 16:22:24 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.23 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.23; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.23) by
 DM6NAM12FT016.mail.protection.outlook.com (10.13.178.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.12 via Frontend Transport; Fri, 17 Apr 2020 16:22:23 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 03HGMKqT025929
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 17 Apr 2020 12:22:22 -0400
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 17 Apr 2020 18:22:20 +0200
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 17 Apr 2020 18:22:20 +0200
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id 03HGMKPh031058;
 Fri, 17 Apr 2020 18:22:20 +0200
Received: (from pthombar@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id 03HGMKqS031057;
 Fri, 17 Apr 2020 18:22:20 +0200
From: Parshuram Thombare <pthombar@cadence.com>
To: <bbrezillon@kernel.org>, <vitor.soares@synopsys.com>
Subject: [PATCH v6 5/8] i3c: master: check for non null pointer
Date: Fri, 17 Apr 2020 18:22:07 +0200
Message-ID: <1587140527-30907-1-git-send-email-pthombar@cadence.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1587140398-29473-1-git-send-email-pthombar@cadence.com>
References: <1587140398-29473-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.23; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:rmmaillnx1.cadence.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(36092001)(46966005)(81156014)(426003)(498600001)(47076004)(2616005)(86362001)(8936002)(36756003)(8676002)(6666004)(5660300002)(107886003)(336012)(4326008)(186003)(26005)(81166007)(42186006)(4744005)(2906002)(356005)(70206006)(110136005)(36906005)(54906003)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d4ed565-01a0-4750-96b3-08d7e2eb82c6
X-MS-TrafficTypeDiagnostic: SN6PR07MB5695:
X-Microsoft-Antispam-PRVS: <SN6PR07MB5695252483B6585C76A7240EC1D90@SN6PR07MB5695.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0376ECF4DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F18tmzeITF+iGE/ctjWNURuWn6A2ih6clgK4r7yS3puS0jeVSA8lZzH9Zf2QGZyt+pqd3rL4soh3rgVVLDoWn+fszrKRuck/I40MMS95GGThxjhS4r2PnIy5x9CH1+eC4Yl+jajt4Axowj1C69gZ6BaYoGKyVqzOZtXVacCaYGEv0+6Y4n5fwnz/3ssvc0dBwEPfNBBIdTGMhkWGzYpCRaxdHxg3to63pvJ6INz7bQ2u17kLNocgSzIQ3UZEKVi/vRzStS/+xtfs/LAg6KU8oCptmnxGcVy4XxdHdaEHQJY9DGQnkGM6TQ8GXmjSTsvOeV3i8BnDx30fNPd2wxn0tNeUBP4RU3b+nZgwYz2c20tA5xf1rtkFFHJSx/1S9Zaq5kssotp3IJ1S8tMJtyRUWiJyBgz+nxDdjwhnmzbRRyZkwJlPXtEXFIwrLB2bboODtDrJiwk90DLKkGw1iHInyjDjg/oKnykqvk0GE4lFhZ72H3EAClwtRiZDnIW/i2+vwXQ6svgT8jmDs0p9QWdTjlqM0W75xPR0Y1ECBwWAmGg=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 16:22:23.4679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4ed565-01a0-4750-96b3-08d7e2eb82c6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.23];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5695
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_07:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=937 suspectscore=2 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004170129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_092228_731645_9BAEB391 
X-CRM114-Status: GOOD (  10.15  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: mparab@cadence.com, Parshuram Thombare <pthombar@cadence.com>,
 praneeth@ti.com, linux-kernel@vger.kernel.org, pgaj@cadence.com,
 linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

This patch add NULL check for struct i3c_generic_ibi_pool *pool
argument of function i3c_generic_ibi_free_pool.

Signed-off-by: Parshuram Thombare <pthombar@cadence.com>
---
 drivers/i3c/master.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 2690910d724c..19d4800ed573 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2667,6 +2667,9 @@ void i3c_generic_ibi_free_pool(struct i3c_generic_ibi_pool *pool)
 	struct i3c_generic_ibi_slot *slot;
 	unsigned int nslots = 0;
 
+	if (!pool)
+		return;
+
 	while (!list_empty(&pool->free_slots)) {
 		slot = list_first_entry(&pool->free_slots,
 					struct i3c_generic_ibi_slot, node);
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
