Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90463C43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6040F2053B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 10:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DqfdJ370";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Rhd+4Snb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Up1MpAWM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6040F2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7A3vTQzSOHyibhmLzkgysTrkWwH9gRnmBGwPrlGVHlo=; b=DqfdJ370EAEvDG
	QxSAVzUa/SlNZjvZ1ZmWy+0x/NQyuh02bXfPS3s4JVjUNZA6G/+g3AxSIDJsnH1WPM4ttvoLVLsqS
	h1KACDlus0USgYE+K9/yIXOh0kdV45HU1Hkqw+uEP39uKeiaNu+yIMnkWQ16bYY1ry+IWLi0BaASz
	H9tKViPH+TZ5L6CmaHnj4sh8vFviToQ7DztSXGEHylqL+yBBjmFWfsOrxN1ZrVRTEQ1/eTeJS53RZ
	zbWzvF5LaVQaSGR7aTcU4ha5Aghz1v3ql71eBuU9U/aiP/IxB2mANTjL9OfgF9hbn0jP0TVLiuLHn
	ix9zUdOIP5PtJ/WsPQFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iecYL-00081p-Fr; Tue, 10 Dec 2019 10:15:37 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iecYH-00080o-PF
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 10:15:35 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAA9t0w027933; Tue, 10 Dec 2019 02:15:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=proofpoint;
 bh=uH7LVsTg1M5+5NRmLZVpnnmGrSGQWON+5FBOhW19FoA=;
 b=Rhd+4SnbbEXEA7lhaQC+W6cWgc1Y7GN2D5E7Twl8Aqik60d1+RmOgCN49fjUg7jts7jF
 s4BPakF5vo8sylS/VnVY0uXh0Vq0eB1VEd0RclSnHTajSZB0dEbwb6LLNKeW71qplDef
 /+nxgaw8pj0997OXRnccxy6xbvtp8EKwdescvzI1YqRux06BC+0pnoXTs+LSBbF3NVvv
 VQLT0u1CQjPud3EbBdukWKJkyv4dPwLUEZPq7lSPIMq2somwm/Q8b8fKtfkuGRiMwjgo
 uVPvOXkUkKv4N3i4GE/G6lLaq/u4ttetJXikMWLsodulp5cF63rOb/toTZGJrZKF3Xio IQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wr9dfhdav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 02:15:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQ0oLOuQ3Ze9NlA81UJtvs94R/S42piajc5e0GIHFgY7JNSXy7s+k6/prESSWJhb75d3WqPPG2MdqQ1HQP4gG/D5/0+cy0EV5aXJOe0xTHXNXDPiNaOkAUPL3lUzAytYGMDsYGYhOwddrwCed0ZaJipSbGIDVi2ozDDysDHAAq8QfemwqaM7BP19VUIMkr0G6cuGQAbg/oKkQWbJBNfC7dx/qvudpxLAjCYLx61rdBj6PQa+XvQky/G24whrjjOnjk2SQFz1J87qXNa7Tvubfi9njB67QQcX2AB3iUD0eNdzdwufJo+360ux9PJwQXDTBsKFQrdhUcdhuyjy4uur1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH7LVsTg1M5+5NRmLZVpnnmGrSGQWON+5FBOhW19FoA=;
 b=eOI022VopfuA+aB7mXZkULyw2ssIOeDwql1jXi4vpYbnIuhDh7QagIrJXNYxOLSqtbNrVxZy09ZXyyz6RbYrm2Js3JWBEW7Au9fVa1ucI7JShYKOSUetjMyBeCU5wIG9TW/iUXRCkyQNxAO17WiudW2beWquwhCdWclo8sWMkQgHrKMSjUoVxL99InSFLjNcxQYWNU7hRK8YZoDZCgjYEVLIKJ3k6zdZeUbi3wx9JFz8DhCJ+ZNrLbKBCXANK8E2cYf5/as64iq/+Decvy+M71NKwyCZn6PmtsHXk8b+1+j4/Ovi9875tFh896/5DMMyYzMzz3MxEpXJE3bea9p7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH7LVsTg1M5+5NRmLZVpnnmGrSGQWON+5FBOhW19FoA=;
 b=Up1MpAWMdP0wvR1HN9j9rX4rrNR9Yw/vrKBbTtp9E4Ngtb+MfJdrl+yU3t5GYcaHs6FdWyYdSj8OsS1X1NyyprLiR7EeLkkJD5IU8rivqzssipZDu/Gto5KROKkybK9I3OFm3dwxtbIIxe7yBSPk62IBFUf1JaXpoG//hHc2Wms=
Received: from SN4PR0701CA0041.namprd07.prod.outlook.com
 (2603:10b6:803:2d::26) by DM6PR07MB5433.namprd07.prod.outlook.com
 (2603:10b6:5:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Tue, 10 Dec
 2019 10:15:26 +0000
Received: from DM6NAM12FT007.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::205) by SN4PR0701CA0041.outlook.office365.com
 (2603:10b6:803:2d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Tue, 10 Dec 2019 10:15:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM6NAM12FT007.mail.protection.outlook.com (10.13.178.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 10:15:25 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 xBAAFNQR029354
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 02:15:24 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 10 Dec 2019 11:15:22 +0100
Received: from vleu-orange.cadence.com (10.160.88.83) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:15:22 +0100
Received: from vleu-orange.cadence.com (localhost.localdomain [127.0.0.1])
 by vleu-orange.cadence.com (8.14.4/8.14.4) with ESMTP id xBAAFM9m008941;
 Tue, 10 Dec 2019 11:15:22 +0100
Received: (from pgaj@localhost)
 by vleu-orange.cadence.com (8.14.4/8.14.4/Submit) id xBAAFLpS008939;
 Tue, 10 Dec 2019 11:15:21 +0100
From: =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v4 0/6] I3C device addresing adjustments
Date: Tue, 10 Dec 2019 11:14:56 +0100
Message-ID: <20191210101502.8401-1-pgaj@cadence.com>
X-Mailer: git-send-email 2.14.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(36092001)(76130400001)(5820100001)(6916009)(36756003)(107886003)(336012)(478600001)(70206006)(316002)(70586007)(2870700001)(8936002)(246002)(4326008)(8676002)(26005)(186003)(2906002)(42186006)(426003)(26826003)(1076003)(66574012)(2616005)(54906003)(86362001)(7636002)(5660300002)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB5433; H:sjmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd64fa3-d139-4572-5d63-08d77d59dff2
X-MS-TrafficTypeDiagnostic: DM6PR07MB5433:
X-Microsoft-Antispam-PRVS: <DM6PR07MB54335FF91C5742FD92DF1D25C25B0@DM6PR07MB5433.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXO4NnjTICbExth0SV792fOkSL7k5cJ379IhmDD1f1P1N1LJLQyqPEVVaqT83PQvZknqrBd9YOErkP65C9qePbPq52JyNhri1L+H8CgTr6Xr2GXFyJnmWWrbqooQFbEO0uOCgYNNBigUT8K18lj4+SsD6vb+F4G/cP6gGzAEZcDxKs7EAFsMyP9WCp1pZxoPEOoQs/NxgGvCwdQvQuqfMAg0a1h5ALVPcKhyoPh390s5kBM3iK0+NRfpd8z8TGFwkU4lRV+1XbHufsqWlhPJK8HYTY5FRoLh+3mtoSCr3jRAt6NHgS3wmnd+zSBc4T3P1iLir/LdAdDSgkSRqb5p05BLgrLgU+upWHFcPdIS+WVCOX8wUULSVCmnZSox6f+o/sMc9NTQMBgXBaqLdfsAvsCCseTmhgWKCVLpH6a6JngHEbH0I/4ExXkPBRrWzMjROu9ayMZCnIHZLMLVnI+XkgGi/jKT6an76nw6HEHRwM7m/KrBuY06QW3c84TTOplk
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 10:15:25.7857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd64fa3-d139-4572-5d63-08d77d59dff2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5433
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 suspectscore=3 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=804
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_021534_211529_91D7B59D 
X-CRM114-Status: GOOD (  11.88  )
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

VGhpcyBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gVml0b3IncyBTb2FyZXMgcHJldmlvdXMgcGF0
Y2ggc2VyaWVzLgpJJ20gdHJ5aW5nIHRvIG1lZXQgcmVxdWlyZW1lbnRzIGFuZCBjb21tZW50cyB3
aGljaCBjYW1lIHVwIGR1cmluZyB0aGUKY29kZSByZXZpZXcuCgpEZXNjcmlwdGlvbiByZWxhdGVk
IHRvIHRoaW5ncyB3aGljaCB3ZXJlIHRha2VuIGZyb20gdjM6ClByb3BhZ2F0ZSBpM2NfYm9hcmRp
bmZvLCBpZiBhdmFpbGFibGUsIHRvIGkzY19kZXZfZGVzYyBkdXJpbmcKaTNjX21hc3Rlcl9hZGRf
aTNjX2Rldl9sb2NrZWQoKS4gVGhpcyBjaGFuZ2Ugd2lsbCBwZXJtaXQgdG8gZGVzY3JpYmUKZGV2
aWNlcyB3aXRoIGEgcHJlZmVyYWJsZSBkeW5hbWljIGFkZHJlc3MgKGltcG9ydGFudCBkdWUgdG8g
cHJpb3JpdHkKcmVhc29uKSBidXQgd2l0aG91dCBhIHN0YXRpYyBhZGRyZXNzIGluIERULgoKSW4g
YWRkaXRpb24sIEknbSBpbXByb3ZpbmcgdGhlIG1hbmFnZW1lbnQgb2YgdGhlIERhdGEgQWRkcmVz
cyBUYWJsZSBpbgpEVyBJM0MgTWFzdGVyIGJ5IGtlZXBpbmcgdGhlIGZyZWUgc2xvdHMgY29uc2Vj
dXRpdmUuCgpTZW5kaW5nIHRoZSBkZXZpY2VzIHdpdGhvdXQgREEgaW4gREVGU0xWUyBmcmFtZSB3
aWxsIGJlIGZpeGVkIGluIHNlcGFyYXRlCnBhdGNoIGlmIG5lZWRlZC4KClRoZXJlIGFyZSBhbHNv
IHNvbWUgaW1wcm92ZW1lbnRzIHJlbGF0ZWQgdG8gRFQgYmluZGluZ3MgZG9jdW1lbnRhdGlvbi4K
CkNoYW5nZXMgaW4gdjQ6CiAgLSBSZW1vdmUgZGV2aWNlIGRldGFjaC9mcmVlCiAgLSBBZGQgUElE
IGNoZWNrIGJlZm9yZSByZWdpc3RlcmluZyB0aGUgZGV2aWNlCiAgLSBBZGQgcHJlLXJlc2VydmF0
aW9uIG9mIGluaXRfZHluX2FkZHIKCkNoYW5nZSBpbiB2MzoKICAtIENoYW5nZSBjb3ZlciBsZXR0
ZXIKICAtIENoYW5nZSBjb21taXQgbWVzc2FnZSBmb3IgcGF0Y2ggMQogIC0gQWRkIFJvYiByYi10
YWdzCgpDaGFuZ2UgaW4gdjI6CiAgLSBNb3ZlIG91dCBkZXRhY2gvZnJlZSB0aGUgaTNjX2Rldl9k
ZXNjIGZyb20gcHJlX2Fzc2lnbl9keW5fYWRkcigpCiAgLSBDaGFuZ2UgaTNjX21hc3Rlcl9zZWFy
Y2hfaTNjX2JvYXJkaW5mbyhuZXdkZXYpIHRvCiAgaTNjX21hc3Rlcl9pbml0X2kzY19kZXZfYm9h
cmRpbmZvKG5ld2RldikKICAtIEFkZCBmaXhlcywgc3RhYmxlIHRhZ3Mgb24gcGF0Y2ggMgogIC0g
QWRkIGEgbm90ZSBmb3Igbm8gZ3VhcmFudGVlIG9mICdhc3NpZ25lZC1hZGRyZXNzJyB1c2UKClBy
emVteXPFgmF3IEdhaiAoMik6CiAgaTNjOiBtYXN0ZXI6IHByZS1yZXNlcnZlIGJvYXJkaW5mby0+
aW5pdF9keW5fYWRkciB3aGVuIGF2YWlsYWJsZQogIGkzYzogbWFzdGVyOiBtYWtlIHN1cmUgdGhl
IFBJRCBpcyBzZXQgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBkZXZpY2UKClZpdG9yIFNvYXJlcyAo
NCk6CiAgaTNjOiBtYXN0ZXI6IG1ha2Ugc3VyZSAtPmJvYXJkaW5mbyBpcyBpbml0aWFsaXplZCBp
bgogICAgYWRkX2kzY19kZXZfbG9ja2VkKCkKICBkdC1iaW5kaW5nczogaTNjOiBNYWtlICdhc3Np
Z25lZC1hZGRyZXNzJyB2YWxpZCBpZiBzdGF0aWMgYWRkcmVzcyA9PSAwCiAgZHQtYmluZGluZ3M6
IGkzYzogYWRkIGEgbm90ZSBmb3Igbm8gZ3VhcmFudGVlIG9mICdhc3NpZ25lZC1hZGRyZXNzJwog
ICAgdXNlCiAgaTNjOiBtYXN0ZXI6IGR3OiByZWF0dGFjaCBkZXZpY2Ugb24gZmlyc3QgYXZhaWxh
YmxlIGxvY2F0aW9uIG9mCiAgICBhZGRyZXNzIHRhYmxlCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kzYy9pM2MudHh0IHwgMTUgKysrKysrKysrKystLS0KIGRyaXZlcnMvaTNj
L21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysrKysrKystLQogZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyAgICAgICAgICAg
IHwgMTYgKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCiBtb2RlIGNoYW5nZSAxMDA2NDQgPT4gMTAwNzU1IGRyaXZlcnMvaTNj
L21hc3Rlci5jCgotLSAKMi4xNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWkzYwo=
