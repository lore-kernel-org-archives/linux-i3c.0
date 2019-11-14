Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8551C43141
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60F520718
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVxorhU/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="nmZVv+pI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="KaYa0kvG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60F520718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcowpiVPqn+s+fhK+GV6LYxB4Rf7ptkAALr/OcREgZA=; b=NVxorhU/7skOp5
	OFgmYoOwz9nnBAZZXrSUvNAHXlNI6icWYyJbk637ulED3EXgvQqcdyhAD64ce5LZxtsPu7GtjT/l4
	c3TU5DQydsi9pfdyNpZI2ydGcDG+DjsjHw742WNt7dAE7fACvC4ufBZvR7F+i6v8E8qXJ/lE0PwMo
	YSTtjtNptiJ7zsm4la/YucszCW+QMq+63omwX6eFgFCW99K2a47RdJioH22Nua7fnQe0IBZw475xg
	L6HzPx0gO/dNp2Tjzd8zvO70TRUNBuwEzhvFDRn2TMqZXaoz4F/1F04jAlKj/0d9lMCyjt0ST9XOY
	g4hCwOt9pGGPe5rITgRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV83c-0000Bq-DN; Thu, 14 Nov 2019 05:52:40 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV83Z-0000As-6E
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 05:52:38 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAE5qQkX009040; Wed, 13 Nov 2019 21:52:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=/NelT+Os21BOPEXrJBd7KYOhWSv2H9FR/LQxhQfy/Hs=;
 b=nmZVv+pIR437X1o76XFmre/e+PD68xFvnvyNJLPVkmsa6ABbh7my2Lbov4oR+S2hgKXs
 lChR9bLPZhQTDu34G0qbAVbcPudVdjwOJelE5MtvtA+pyC0BkhUbZg7ZuLHwgKdnwDom
 /fMjKEPoC5s02cjFqQ3bmNvLHI7TducPektzUGgDWC+mysf04xQK1Yko8k4wY9cq12nS
 pVDjHTD+wFYyPSOrsM9L23pgR0EJyL0Yd6SeGZekbh7rvLbH3pRup+gV8RUU1VeojAOl
 Cbe3PyyXzrlctCYUEOnXHom1+vc5MWAY/lHOB1Xw7Oc44PFegIVa1OvhALW0RsNxgbug 6A== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2058.outbound.protection.outlook.com [104.47.44.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w7pry99ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 21:52:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je8TRRIpSZ4kXFeGQHUKhCQxKibv0OPjz5L8Y1b4H1bJHd3L94YKa5Oy5YLc1VBS9e0lOj2nPqpUl9jKEw0hGhw29ljoQDgzGkUfyzYMbBNBpIoTzSDjR7GJcLqOQqwGgB2QmCvcpbbOw1TL31kGJKPAOtFFpzqL7eKAxMlrIeqCCs0XvzWv2IyEK/LkvfFX96FB/qbUHktVFuc8IYmdGUxwmNX6XlStTurO6qE0s9dQnJuKP5/7/TvA/sHqT2qfRB2pTAqCd/rx1Mhsd85FhSbTqjc/hgvwb/uDfV2lLSSr3JH0lIKbwk2QYgnUjkxz6japxhzNyfU8uZBxRmmaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NelT+Os21BOPEXrJBd7KYOhWSv2H9FR/LQxhQfy/Hs=;
 b=hUNlp7G4GtGeOxz6fidJvxFWHaNLK3CmgnKGg3tjzByaZLGamX5ylW/XV7UwwezI1/gZC6eKXtGpTL0+R3sRkMmhIjWfHp5Wah43z+wizJ4hhnAqKNYzX190JHJVkpHCtzWt8YArecDjZL6c8/mB9JWeX1WylM4/1gYggApmqjZC5LRFUCOrHy46EG2kxE3HAJd1cDA8qsgnUzZwGlQ3EORTpjZHVF/IpcS85GUBFhwQnwM4g3KtVd2ZtGCDEgAoIIehoeSzAQhVikozmLJtUuKQmRFP+zI28Pundph1Py+SAcKZnCKbNOiCfQfl3MGeSXQZFVvyAHvmClripqZmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NelT+Os21BOPEXrJBd7KYOhWSv2H9FR/LQxhQfy/Hs=;
 b=KaYa0kvGqCnUC9WiQO/i4MzDQz6q9cRtnmYABLdf9G6bRl8qwAptmFfRAHhPVs8iKJSBrHcQA4zQiHk3R0B+T8DPD0Sl21O+Tzl1oz4mh+WcNmxUIkXs6Qvdma0mgtXWWKNCipowtaHxi+Rm5nI7GLIZ5dMAMKxMKCsBDiL+djo=
Received: from BYAPR07CA0024.namprd07.prod.outlook.com (2603:10b6:a02:bc::37)
 by SN6PR07MB4320.namprd07.prod.outlook.com (2603:10b6:805:55::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 14 Nov
 2019 05:52:30 +0000
Received: from DM3NAM05FT016.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::203) by BYAPR07CA0024.outlook.office365.com
 (2603:10b6:a02:bc::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 05:52:30 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT016.mail.protection.outlook.com (10.152.98.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15 via Frontend Transport; Thu, 14 Nov 2019 05:52:29 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xAE5qRmQ028505
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 13 Nov 2019 21:52:28 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 14 Nov 2019 06:52:26 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 14 Nov 2019 06:52:26 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAE5qQmK020545;
 Thu, 14 Nov 2019 06:52:26 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAE5qQj9020544;
 Thu, 14 Nov 2019 06:52:26 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 2/3] dt-bindings: i3c: Document data hold delay feature
Date: Thu, 14 Nov 2019 06:51:54 +0100
Message-ID: <20191114055155.20446-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191114055155.20446-1-pgaj@cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(136003)(376002)(346002)(189003)(36092001)(199004)(356004)(186003)(48376002)(36756003)(426003)(76130400001)(446003)(11346002)(6666004)(50466002)(1076003)(107886003)(7636002)(305945005)(5660300002)(76176011)(16586007)(51416003)(47776003)(486006)(26005)(54906003)(476003)(2616005)(126002)(316002)(42186006)(4326008)(336012)(2906002)(2351001)(87636003)(26826003)(50226002)(8936002)(478600001)(6916009)(246002)(70206006)(70586007)(86362001)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4320; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9af904e7-8e49-432a-6286-08d768c6d5b6
X-MS-TrafficTypeDiagnostic: SN6PR07MB4320:
X-Microsoft-Antispam-PRVS: <SN6PR07MB43201716A31CE66335447D3CC2710@SN6PR07MB4320.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WWiU0a5wxt18OlcDqtXj6n4CIPIRyBAYd7AHjp7Gu+XyKd1C8KoqMTESbQdu3robfAUsJ53heMF7DQ0rd4KErbpc+O90P3LFvNYtMuiGisECxUzJHMws3hwzJAKReqnuZRla/B7LPGyo97YMJ/ZadJDg2+XFQ62HJ8rbDT9iTTntTOlB6yqASKRApJC8vslHbBFVMS10gOvZr4WQZew08FZfCqmTdbR16z+BqKnR39GLLJtzksQRv2is0YKfCrgND3w4aqes3vwnZ3i05yvoBqR1FtoO81PNReoOxLfXM6iTrQ3/sJCtfaOTCus7Jg7ZP40BeX07N82zoIHjzXx10tqE9Fz0FNWxhRRrq0tzCkRyemJlViQ+wzdBVcc2DOSTuSWfwYHtCIG6c9yfbSJsLFzSGVnpU8R1na5d11jS070JfyvDJs/RG420JbTUDq2dQhi5qH8JnhQTKYYxLJAarA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 05:52:29.3426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af904e7-8e49-432a-6286-08d768c6d5b6
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4320
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_01:2019-11-13,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=1 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=857 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_215237_350230_9B7EF309 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 Przemyslaw Gaj <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Documenting THD_DEL (Data Hold Delay) feature of Cadence I3C
master controller.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
index 1cf6182f888c..7d6349354390 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt
@@ -21,6 +21,12 @@ Documentation/devicetree/bindings/i3c/i3c.txt for more details):
 - i2c-scl-hz
 - i3c-scl-hz
 
+Optional properties, Cadence I3C master controller specific:
+
+- thd_del: Data Hold Delay. Sets data hold delay (i.e. SDA_OUT data
+	   line will change its value with extra delay that specified
+	   in this register).
+
 I3C device connected on the bus follow the generic description (see
 Documentation/devicetree/bindings/i3c/i3c.txt for more details).
 
-- 
2.14.0


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
