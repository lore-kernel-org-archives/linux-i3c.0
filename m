Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD6C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0AB20718
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 05:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2VS4cEq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="a/bgPcqH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="55a1zipp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0AB20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF4nJT8pdikWfAlNnrPQd383/aLHr7QIWpc0uuYKz5g=; b=T2VS4cEqt5bQ3b
	mvA/yxpgAtQthQ6uS4tl6SYRPBcakBcA+fTXTyKPEfztY00ovZqf4wxE370PtR2bMmw1Q0XWDjP4g
	ookI7j5D3R/yKefSixvFInzNxpxtHptsTlg/SWN7ukvHJlEehxjzHlGSW4vQlQecAWqOQz8UQvEjF
	vYKrv6hU4AaRMi8bAQjL9s7JNQatUSolLK1wbnnW+2fUQsIeIpEp/m81bneeg6CyTmQEpyzQeaitW
	EcSxMiQZnVANPWtF6OgUCabz6Ky0EKqzJpidIvcVKHyEHnBu5vDaecZFhhVeFaUvpwvkBzV3AVBXC
	h+22Bx8Tnq6Pk9MFizmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV83b-0000BY-9M; Thu, 14 Nov 2019 05:52:39 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV83Y-0000Ay-OG
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 05:52:37 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAE5ko3N032204; Wed, 13 Nov 2019 21:52:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=proofpoint;
 bh=atraJZgIt9DANKvXN7BOd55jXRaEgQfhGBg09T/42CA=;
 b=a/bgPcqHJeTkfhoZWChokNBpdcbcrQWMXU47EEmFPlo5U8rPW1KrUz1LjLbXrjoqkQyv
 NkG+CxgT4oeFHOs+RNhKILNuhntyP/C0PJ5ExPEHSdSM9Ge4XWzq2Vaa9bxURIKdV9+K
 oha/zHbDJvvuF3iNZ+P7iSHT5l6pVDNPLU+pCnXutabySWaIxDzEocRgfJRJDy2Xjeb0
 tojma8zmBG1bFFq0FzX6JP5DsruIiihqZAlrowVYdD20hjWjX4x6GviiW31RzAXxaf56
 Nh2909AugRgS16YDN3rTnpKfZDNS2/icS5/puM66320rRtY1P5pg/Nvpt1+Mau/7UUlJ /A== 
Received: from nam04-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam04lp2052.outbound.protection.outlook.com [104.47.44.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt0va8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 21:52:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwqrou7BoTmVGNXHn2UFNLoX/ZlLDWgrCpOVM6OQNb6txOkio32AT4nQRYRDwzigZNKqhW6bEvsDa/taytLTZe2OWEtZ7/cGnKroKFU4UoAG7sjc0Oa9/u2A39+MSoInZMNxB2RdjTbgOQ8LRrnaboGklj/rWYzG1sQPqWRUfH10yrf/qbWrsLEBs4XnKktOLvOYSMShtTc3FuFuCdZYFi1hOEbRKvhWIRZcsgnfrl2fl7WPXmvSRvRlSP9Dlz7C5rkU5P8uBhAvE76yLHK+tHXFzSGdsz4g0KRS4C051B7HGsz3GY/eXkdO/o5asPS94X8gRIn65H/Kv1A2HTgYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atraJZgIt9DANKvXN7BOd55jXRaEgQfhGBg09T/42CA=;
 b=j5/nnAnkd9nUtk2AQym99l3BeVK2D/GYREkGRSkQ14ia+jE4bAsRm+MwpYUoty6yYc1FMmqT/bJ6siSHqF3CZZQYiJmxa2ZITcgp/hMyj/394TcRS+yYzy+mkbtE6QmyyFA6U/o/ymgYTpwp8Nty+8ZMOWB+jKDUPGyM5QC9PXPOwqFx3/I3gzpFnOt2n5KfiD3Ey6yrPhgSJdDDFdnBNcbxZYem45FPLRDOrCCcgJ+8rW0S37S34ZaA1wfgIYy6aPuFFiL///YAkrFKiZvJAN0Jlo0jCbFYv7Vm+7P+ruqnnMPCCF5iS33za+sTZ2Rpa/ysgcR+0ogCQ2RNe6Bdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atraJZgIt9DANKvXN7BOd55jXRaEgQfhGBg09T/42CA=;
 b=55a1zippsbU8UJk4KFPqZJz+7L6CsEHCzyFiGZvMuDBTTjc+yK7TlIVfvfykC4a3RdakIpa3Hc5bpKKPiy/GB5amlQVTnlpoVRIH5Jt/Xfpp70mOWwOBgB23rP2q7YJEmUgoiiKYXe/GKJ2med2ymeggo2V7H42i1kv22PK3yPU=
Received: from MN2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:208:1a0::21)
 by BN8PR07MB7026.namprd07.prod.outlook.com (2603:10b6:408:7a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 05:52:34 +0000
Received: from DM3NAM05FT057.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::203) by MN2PR07CA0011.outlook.office365.com
 (2603:10b6:208:1a0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 05:52:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 DM3NAM05FT057.mail.protection.outlook.com (10.152.98.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15 via Frontend Transport; Thu, 14 Nov 2019 05:52:32 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id
 xAE5qT4L060997
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 21:52:31 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 14 Nov 2019 06:52:29 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 14 Nov 2019 06:52:29 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xAE5qTTG021802;
 Thu, 14 Nov 2019 06:52:29 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xAE5qTud021801;
 Thu, 14 Nov 2019 06:52:29 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH 3/3] MAINTAINERS: add myself as maintainer of Cadence I3C
 master controller driver
Date: Thu, 14 Nov 2019 06:51:55 +0100
Message-ID: <20191114055155.20446-4-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20191114055155.20446-1-pgaj@cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(136003)(346002)(376002)(396003)(36092001)(199004)(189003)(336012)(446003)(70586007)(1076003)(11346002)(476003)(2616005)(426003)(126002)(486006)(2351001)(106002)(36906005)(2870700001)(70206006)(42186006)(54906003)(186003)(4744005)(23676004)(2906002)(76176011)(26005)(5820100001)(5660300002)(47776003)(36756003)(50226002)(8936002)(305945005)(6916009)(87636003)(478600001)(6666004)(356004)(50466002)(81156014)(81166006)(4326008)(107886003)(8676002)(316002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB7026; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d55fa60-2201-47dc-9aa5-08d768c6d79d
X-MS-TrafficTypeDiagnostic: BN8PR07MB7026:
X-Microsoft-Antispam-PRVS: <BN8PR07MB7026E1E4AA90AC346269B3D2C2710@BN8PR07MB7026.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZvwgpBo2Y6wB91qYJ9SPUHRMookuryKUUNnSlhCtQJ7KFug4vz5UxVDmEiUkFivx2rcWCwUhyCHLeCmvXURcezpexkM3tlQbO4tm3RXdGNcdq0djlRi485QnIBeBp4oSQ8a5U2stdj1z5UZh6E1fB70VIiu0OtsiQsKMzKt1GyU++M1vINj7y3LA0YBGUWdYaE2WYBKmG0XMUvRGxcvFVTiVfpYX7rc8xeS4fw0b+K708IGC0m0k7BIAmWrYX6JyPWM5TINKQIzJ4VVLXcCuI7VWCwskBTDqQydXGkBh+VvyVFUAiB3I6NQ0MaMVtVmP1ycz3znbKOv7MjMp0IYN2dAIKeLof8ktKGlZxj83IOn9Zlzh9XkOqJHms6bD2zk2Cb8EXPKbmtJMfxF0RSppCBnZA0DLdvwW0Giuqooxw+GrrLnEp0MxFfwCijSVefMiFkXMmwT4xqzUTbnoz9X99A==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 05:52:32.5303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d55fa60-2201-47dc-9aa5-08d768c6d79d
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB7026
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-13_06:2019-11-13,2019-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=1
 mlxlogscore=819 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_215236_791143_F9B38FA0 
X-CRM114-Status: UNSURE (   9.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

QXMgZGlzY3Vzc2VkIHdpdGggQm9yaXMgQnJlemlsbG9uIC0gSSdtIGFkZGluZyBteXNlbGYgYXMg
dGhlIG1haW50YWluZXIuCgpTaWduZWQtb2ZmLWJ5OiBQcnplbXlzbGF3IEdhaiA8cGdhakBjYWRl
bmNlLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRl
eCBjNGM1MzJjNzBiODYuLmFmZGNlMTZkMmJlNSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysr
IGIvTUFJTlRBSU5FUlMKQEAgLTc4MjEsNiArNzgyMSwxMiBAQCBTOglNYWludGFpbmVkCiBGOglE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTNjL3NucHMsZHctaTNjLW1hc3Rlci50
eHQKIEY6CWRyaXZlcnMvaTNjL21hc3Rlci9kdyoKIAorSTNDIERSSVZFUiBGT1IgQ0FERU5DRSBJ
M0MgTUFTVEVSIElQCitNOiAgICAgIFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4K
K1M6ICAgICAgTWFpbnRhaW5lZAorRjogICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTNjL2NkbnMsaTNjLW1hc3Rlci50eHQKK0Y6ICAgICAgZHJpdmVycy9pM2MvbWFzdGVy
L2kzYy1tYXN0ZXItY2Rucy5jCisKIElBNjQgKEl0YW5pdW0pIFBMQVRGT1JNCiBNOglUb255IEx1
Y2sgPHRvbnkubHVja0BpbnRlbC5jb20+CiBNOglGZW5naHVhIFl1IDxmZW5naHVhLnl1QGludGVs
LmNvbT4KLS0gCjIuMTQuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
