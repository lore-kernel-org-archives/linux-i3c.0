Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FA1C2D0BF
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8869F207FF
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eDaccU2w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="EVMgHzjx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="zsqk4GQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8869F207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDHzhw+6lfRrsAxT5HOFU8pVfhwl1ImMplHuGsaeaok=; b=eDaccU2w/jT5BO
	y1XclRtzcsDaLYn0jMAVP3nxtl0SpXypZCKyGUxQZbr8QADOmicw55SpYQT4R6rzitWuKmyaIYjqq
	7t3iqauPb57zdBaC1ieErU0oEMYeqAPz9aazgtC1JtUo9DsIhmEnJ4EIOaN0NRQl3W1Mx+08CtM9+
	re6bLg4xIzdSParM/3AsrniffrLMDeu/vCv1x6Dobra8IR6FGEBFiTqjrlcabU3Li9bSOEn3QqZxp
	3Sm88Ps/pZMXf5z2XxmbzNLi0uTh4bTYYjt0IOogLgPU4v+1VoFyHjnjR87a4Ycb13BLteYuQbbBg
	KVBdJZY/420J/h0Mx52w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYP-000831-Lx; Tue, 10 Dec 2019 10:15:41 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYN-00082M-JW
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:40 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADLgG025727; Tue, 10 Dec 2019 02:15:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=proofpoint;
 bh=c7RMa7OTRfnwkv1Kq4aBBWGsYuTxR3F4IpkzLuoeJcg=;
 b=EVMgHzjx1Pb4PhFUFwhrlpn1j9N+WY/piJpvARQG1xDmuS/4NtPQhMmu2ISP2n57Yi4W
 6fCUYJo9xDvkuJoC9Hbd3hf/dCeacqxJzi79lUGkdslCbOOgZgUHuN/ru9rIlIb+OLe9
 uFJ0cZWxKkWCitrx/LiljRN9xnxYpQji5qK/EJbQVE+9em1Pep9aP02BxYRsnKh/PyB2
 4yWmO+WRE9q0ZVdY4OMnGr5DgmpYJ7jG+JirTs1OO/+/GdpXDhBjm8xXEtr1ebf7vmKY
 WTCNZ+8ZUPbyXmtJOF0lz6Y6kdsyA4CwoNsO8I2C7OLu4CnFkUGF8hwcyQVp8rz0ZnSH ow== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2056.outbound.protection.outlook.com [104.47.46.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k71BPrVdnAP3FW5/Y2MHiRiku2Xj/UQrLd307Y1H6O6u0eR6sFKAL7WxvjP72xpdfIunq26slxmOJhGEBVfI1rWsjNUIC0/SDV1aLHKVee3kEqyaHB9n1IZFn+VK8ELHAuAZ9iqR1bNJLUcjMCYOX7euE8wy/bua5QWyt3SHi9ZV/NbfMwmcB3xX7WkO90CqJ3H/T9TXtcE13sEPBdzjjo0PsKnq1hPiW5rgDV1hEMlqVqqmBwQPbGcN2/NeBukTbb4BFwZDdMojV0naVzCLFEPnn3aj7EdId90Ds0n3KKginZlGtQ0PZKAIVLKRjXHO75K4tb+dzAExPEk04sLVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7RMa7OTRfnwkv1Kq4aBBWGsYuTxR3F4IpkzLuoeJcg=;
 b=fbR5xD8261YTbZnsE8e4eZbnSVZ7irPqbcrc4JAeiqPK84uFEn0p7+zmtN2XMIKfitFItlqA/CGQAh53kvGcz7T9fVXe4vnPB1squEGatX8NpBGuVz4YkWKESGDn8fAq9kkS03D92vcSsfQWPCftJ4Dusz8UgOBZ5YntG56TnDEoxcMBtn3eSeeNt+O9ueNRtjxr2if3i+/N49D5t7DPbV1fKITgluIvuM99CFBZT4MGP3vemYNgM0rvq5JkMbYM5QWSeTNC2O+56vaXYKDRrPki8pNXUiiAYwSgTv+zROCmEHrBQH8HOLoohhS9vTtZlWJfeP3HwEsgrHI3IKoo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7RMa7OTRfnwkv1Kq4aBBWGsYuTxR3F4IpkzLuoeJcg=;
 b=zsqk4GQYweYleNJ3TnjNRH8qjP5KapGNGJAukUpA0mmfNJtdxAltJtGTP3dtkQEb4lmyUh1zCHAjkhMIY+UXo09PzdUlTGTeYwJOV7GohsDSqfaAJJiaonTS+yqyoq3WCyxg892RK3RsSFFa7R53SpcJL+0zPQya0OHmMzhbrxI=
Received: from DM5PR07CA0074.namprd07.prod.outlook.com (2603:10b6:4:ad::39) by
 DM6PR07MB6908.namprd07.prod.outlook.com (2603:10b6:5:1e2::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Tue, 10 Dec 2019 10:15:33 +0000
Received: from MW2NAM12FT010.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::209) by DM5PR07CA0074.outlook.office365.com
 (2603:10b6:4:ad::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:33 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx2.cadence.com;
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 MW2NAM12FT010.mail.protection.outlook.com (10.13.180.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBAAFTmV004194
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 02:15:31 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:31 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:31 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFVdC009294;
 Tue, 10 Dec 2019 11:15:31 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFUXR009291;
 Tue, 10 Dec 2019 11:15:30 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 2/6] i3c: master: pre-reserve boardinfo->init_dyn_addr when
 available
Date: Tue, 10 Dec 2019 11:14:58 +0100
Message-ID: <20191210101502.8401-3-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(36092001)(2906002)(70586007)(76130400001)(478600001)(107886003)(5820100001)(246002)(2870700001)(4326008)(8936002)(26826003)(7636002)(8676002)(42186006)(6916009)(186003)(316002)(5660300002)(26005)(66574012)(70206006)(86362001)(336012)(426003)(1076003)(36756003)(6666004)(356004)(54906003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB6908; H:sjmaillnx2.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47b0f797-bd0a-40b6-d80b-08d77d59e42c
X-MS-TrafficTypeDiagnostic: DM6PR07MB6908:
X-Microsoft-Antispam-PRVS: <DM6PR07MB69085C18D488391810BB4525C25B0@DM6PR07MB6908.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkrh2dzd9ivJBIiAIzKfFeQ98H4M6l4hXXSB5FgCS0QsSWzvKvGM7t+atzXJLWWukJdXcJMwc3PHOX/u5mLinoV/GVMlFYniGUMvi6aw84jkMi1rCEO7D1e3i8kTgXE2Icsiwl3K0FUHshBT2QcyLUZfBpWuIf62yZRDGUQgzfHPqvepJBOLGgc5juxF9xAL5xt2c9JdFS37N6yoqmOTEZia4coOMYpMxwlOSCLTeX3qpBgu0ROC8oPF4Y+Jc/jYnpDnSpafJYL00ad4m049QLeB4g38Ig1eYOqxMwrq/tXFQ8RXD6qAtIHo9oztLyqxYcWfjAt9zdWQc7D535ODG7dYfEIu/Kv/xK0uAd2aNUrwqdyXPJdvoNjEwXLX/gIUh7gZPFlPmHvn2uw+/BWdkbwLtUB+5lu6tZB87nn5KnA20PVrPxyZElohfOijcji3z3UiLR0gCZufFhRz2CoHQatTeH9MRo/LrIaU66vxLM4Q6VUY29a4bRP3Ro4hMNTU
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:32.9389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b0f797-bd0a-40b6-d80b-08d77d59e42c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6908
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=3 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021539_644152_B32715E4 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: linux-i3c@lists.infradead.org,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SXQgbWF5IGJlIHRoZSBjYXNlIHRoYXQgU0VUREFTQSBmYWlscyBmb3Igc29tZSByZWFzb24uIFJl
c2VydmUKLT5pbml0X2R5bl9hZGRyIHdoZW4gaXQncyBkZWZpbmVkIHRvIHByZXZlbnQgYXNzaWdu
aW5nIHRoaXMgYWRkcmVzcwp0byBhbm90aGVyIHNsYXZlIGRldmljZS4gVGhpcyB3YXkgd2hlbiBk
ZXZpY2Ugc2hvd3MgdXAgd2UgZG9uJ3QKaGF2ZSB0byByZS1hc3NpZ24gYWRkcmVzc2VzLgoKU2ln
bmVkLW9mZi1ieTogUHJ6ZW15c8WCYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgotLS0KIGRyaXZl
cnMvaTNjL21hc3Rlci5jIHwgOCArKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKaW5kZXggNWMwNmM0MWU2NjYwLi5mYWI2ZTA2MDlmY2EgMTAw
NzU1Ci0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCisrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5j
CkBAIC0xMjYzLDcgKzEyNjMsOCBAQCBzdGF0aWMgdm9pZCBpM2NfbWFzdGVyX3B1dF9pM2NfYWRk
cnMoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2KQogCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfRlJF
RSk7CiAKIAlpZiAoZGV2LT5ib2FyZGluZm8gJiYgZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2Fk
ZHIpCi0JCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVzLCBkZXYtPmlu
Zm8uZHluX2FkZHIsCisJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVz
LAorCQkJCQkgICAgIGRldi0+Ym9hcmRpbmZvLT5pbml0X2R5bl9hZGRyLAogCQkJCQkgICAgIEkz
Q19BRERSX1NMT1RfRlJFRSk7CiB9CiAKQEAgLTE2NzUsNiArMTY3NiwxMSBAQCBzdGF0aWMgaW50
IGkzY19tYXN0ZXJfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVy
KQogCQkJCXJldCA9IC1FQlVTWTsKIAkJCQlnb3RvIGVycl9kZXRhY2hfZGV2czsKIAkJCX0KKwor
CQkJLyogUmVzZXJ2ZSB0aGUgc2xvdC4gKi8KKwkJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0
dXMoJm1hc3Rlci0+YnVzLAorCQkJCQkJICAgICBpM2Nib2FyZGluZm8tPmluaXRfZHluX2FkZHIs
CisJCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfSTNDX0RFVik7CiAJCX0KIAogCQlpM2NkZXYgPSBp
M2NfbWFzdGVyX2FsbG9jX2kzY19kZXYobWFzdGVyLCAmaW5mbyk7Ci0tIAoyLjE0LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFp
bGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
