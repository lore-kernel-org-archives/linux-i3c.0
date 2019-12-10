Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEC3C43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8878C2053B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYH2p8lX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="fwnGCMYq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="4iA3svFT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8878C2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S2dMaU4+8YKbG6vRL/MU50LftMqHc7QOb7rMriL4Ug=; b=MYH2p8lXrkjk9b
	+slwTdGoii0hFpnle/be1Gm6DKVs8q5hn/TWk7uv26uXNDqXXdk47eLpwHuQHG3hKhEwHtc3xD8to
	DM9IdX9n9lQ8WhmTAmdvosYovmX6KTX8Y66sFoSQbrMVFzD19MNkGFbQIry9f1FxCwcFcJXRvZHzn
	6cX2sB1+PAPm0AUtOxTg9ZomgvIsl9rIvKv+2KVd9DwHdqoBncwzaxSAaNH+R810LaUgV/jWe6vLE
	isE+r8TYgbsjiZFGjEd8O8BgM2tlsreQXli+xcqzwsXrhBIpwhLCtjI7jQ5du+N+RcwBNxPLe0WTX
	ePClB5c9jmLFlTTuhhvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYX-00084w-QA; Tue, 10 Dec 2019 10:15:49 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYV-00083x-Ea
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:48 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAADLgJ025727; Tue, 10 Dec 2019 02:15:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=proofpoint;
 bh=cq2c7r/7isRzyQQWckpwBeP7eb7dRAANXAltrpO4BAI=;
 b=fwnGCMYqCgzg+GZ1GDN5EyHVOXp1xsFYTJhWfQbRgOhekpTkO2oEIZEis+n2kMCjAjp9
 rWpsU8YR5kqydBH6IwY3R6pZUmzDqKzZxiqREpKhozNAbB8eEjIVYSb0lm7iSoY2mWkh
 DwSKYAk2+q/XKSA3AnfGNQn1OyQpB24G/idBvLVQD5yIbpc7mE5KvSkyRUXCVVyk0Kov
 rWATLgWPxk2REq2SCV8F473nggkGiYZfyDj81ZLKnvPAgI3PKlxupFpgJxSDGMBQcAC9
 3W0eErluZaGc7SC0BgU5rpObaNnamauWUBQn+DbiTiaqFD2rU3N5MEqeqx7cbCIXtkKd JA== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra709bnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhO1W2dUD0dMgYoQPZxJkvNCtprw4OcBI5vTU5XJIApVhgyb42KnoqXKTajEtuj9Egwn6RVBV/Hu5TM7BwIeWB6jYP+ZN2Ho+cEh9Lwd2FKtq+Xi8cx08MDzqlfFvmk0XDGOwI6HavipKDC9Np6RuFYh/Xer9tHKJ+9hRS6kdu5CLulR72Ppz89nMEqu3qeEG+VJRk/tHGIYf8d2QfpLU2ry9wJj9dctlnHNWv6ZS5/0F5txzixEkWLyxXy75c565uHxs1LDUJMEyn0UoA3E83aEVl0CFZ+kLeKBSGhCBo0/KnSSP3TPmuCqVLH22EcVZBu6EIWGhli85PvMjQuZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq2c7r/7isRzyQQWckpwBeP7eb7dRAANXAltrpO4BAI=;
 b=LIlf1ioXBs6snznayAz3h6rruMuI1YhmFWKlXv8zzTjYfMw54l+JwRCtawoPB0Ken5hanpmWd2L/kzbUN90QfwCvh7cZ3ckE8dfhANqN2MtNeUcJjmrDp67PdgJbQrKzRKc8uW9VcuStl41gutyCBzYxoARDaOiZuPEVe0sjKU1W3aIt3zTvEUIRdbrEVF1OWH0bKBCsND9tsbRm4qOuopTwe9rb7VSZXAZN+ydcBoOZMSIxXvq2/PQlU0fSamsgXa2tvwZHMAtBjOZkifxtu/7KHrswgDkdKy6BSYCjY0UJRSoP3cbxXDFlCn4+Zc4bcKy0NIdhJHctG3VMA0lujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq2c7r/7isRzyQQWckpwBeP7eb7dRAANXAltrpO4BAI=;
 b=4iA3svFTqlp8wFZmzJBRQ3Ay4C26g4W5moEqiLF6PfIgy2u//dWlKUG7it6Wm4ni+EgjwUn0dRaE7OB4KjU5qobdfcOrJxXrHUswgvAbod75e6/ZHViaNfATHsi/DMTZmB3yCj1uG1fPdwfYYom9YGzGiR8C6s2x6B6c2buWWas=
Received: from BYAPR07CA0042.namprd07.prod.outlook.com (2603:10b6:a03:60::19)
 by BY5PR07MB6627.namprd07.prod.outlook.com (2603:10b6:a03:1af::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Tue, 10 Dec
 2019 10:15:44 +0000
Received: from DM6NAM12FT027.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::209) by BYAPR07CA0042.outlook.office365.com
 (2603:10b6:a03:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:44 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 DM6NAM12FT027.mail.protection.outlook.com (10.13.178.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:41 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 xBAAFZPL102957
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 02:15:37 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:35 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:35 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFZhH009301;
 Tue, 10 Dec 2019 11:15:35 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFZIF009300;
 Tue, 10 Dec 2019 11:15:35 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 3/6] i3c: master: make sure the PID is set before
 registering the device
Date: Tue, 10 Dec 2019 11:14:59 +0100
Message-ID: <20191210101502.8401-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191210101502.8401-1-pgaj@cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(36092001)(199004)(189003)(426003)(336012)(6916009)(86362001)(356004)(6666004)(478600001)(2616005)(36756003)(5820100001)(107886003)(1076003)(4326008)(8676002)(4744005)(316002)(26005)(186003)(54906003)(81156014)(81166006)(8936002)(5660300002)(36906005)(70586007)(70206006)(66574012)(2870700001)(2906002)(42186006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR07MB6627; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc27ec37-8af6-40db-4bbc-08d77d59e955
X-MS-TrafficTypeDiagnostic: BY5PR07MB6627:
X-Microsoft-Antispam-PRVS: <BY5PR07MB6627CAF760D90A04FCABF246C25B0@BY5PR07MB6627.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R0Yd4Ln1oxdlb61KnQ4UVU8/3r4EfWZAVpE8l76KBc3BkvquiVvWBgvkkgjdAwQZ1SdqJyBn6knQUJdJhgQYuJU2JAZU58OCCTi61ho90clDarNB7PkBRo6qn5H8Dj0gFEHB1zGT1xE8Qmp+CUqoOGVohmqnnlxcJw3aH3214BocBBRxmGiM90Cnp0jDoPIrhhYPNJZQxwfF3CxL+jqKTVUSmvlms8R4GY3MmSnqSiYvY65RVnmiMd/G3VXGRSkDMILxm6F/wtWtdx9irYYTDoCZ8XxJtLa1K3rEpWQ3aHCR8xWxYagZxfy2tXLEtqm5sEKjioX5U4CM56yp/M1qq24ly1Pp4r1IRqGehoqdko9/LoDt5ws5M+qsP5yZVQcTWNZQGu0C2iR+knxEDGVtTOztt2SRblbgR+jKeQn7Xp+LEynr2wVl86VpaLRzfpI3iJYvVrzg8id1LOHD8IE+94PY823VvaxQC23Ikr46wi8abkdioQGvD5aI3Ger0dkq
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:41.3324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc27ec37-8af6-40db-4bbc-08d77d59e955
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB6627
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=1 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021547_490477_D4DEEFB6 
X-CRM114-Status: GOOD (  11.47  )
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

SWYgU0VUREFTQSBmYWlsZWQgZm9yIHNvbWUgcmVhc29uIG9yIFByb3Zpc2lvbmVkIElEIChQSUQp
IHJldHJpZXZhbApmYWlsZWQgUElEIG1heSBub3QgYmUgc2V0LiBDaGVjayB0aGF0IGNvbmRpdGlv
biBiZWZvcmUgcmVnaXN0ZXJpbmcKdGhlIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IFByemVteXPF
gmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4KLS0tCiBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwppbmRl
eCBmYWI2ZTA2MDlmY2EuLjRiM2QxYzBmNzc4ZCAxMDA3NTUKLS0tIGEvZHJpdmVycy9pM2MvbWFz
dGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKQEAgLTE0NTAsNyArMTQ1MCw4IEBAIGkz
Y19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKHN0cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xs
ZXIgKm1hc3RlcikKIAkJcmV0dXJuOwogCiAJaTNjX2J1c19mb3JfZWFjaF9pM2NkZXYoJm1hc3Rl
ci0+YnVzLCBkZXNjKSB7Ci0JCWlmIChkZXNjLT5kZXYgfHwgIWRlc2MtPmluZm8uZHluX2FkZHIg
fHwgZGVzYyA9PSBtYXN0ZXItPnRoaXMpCisJCWlmIChkZXNjLT5kZXYgfHwgIWRlc2MtPmluZm8u
ZHluX2FkZHIgfHwKKwkJICAgIGRlc2MgPT0gbWFzdGVyLT50aGlzIHx8ICFkZXNjLT5pbmZvLnBp
ZCkKIAkJCWNvbnRpbnVlOwogCiAJCWRlc2MtPmRldiA9IGt6YWxsb2Moc2l6ZW9mKCpkZXNjLT5k
ZXYpLCBHRlBfS0VSTkVMKTsKLS0gCjIuMTQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1pM2MK
