Return-Path: <SRS0=S0Sy=2B=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EEAC43603
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Dec 2019 08:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05E1F20652
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Dec 2019 08:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UeS30FN/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="YDFZhM+1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="32nAGmLS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05E1F20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVMOv8X/nv1YZbw3e0Gp09YpmHGs53UGftPJ4ffLZGo=; b=UeS30FN/6HxStG
	8+b58HXLuvuro4DfIbePzZ9A0L11vZWPfscOhGgiwJVKimOxm2RNoBZNbdByf39AaYqnGuKyfED1C
	RXyGLxifXUftH87fS1F8DGHIhqCF6kbDS0TxSrbPnlT6Waz6ZMB05H8eqr+HQSe1cWam4PlC0TAm+
	ZXCN/4XLTPuyv6ncWQXrKMi34CmfqH2N/XQFUzwUlYq/M+vfK4GCT/qkImdGoPa2PlYQvrICGU188
	bmZKEUXV3AvidZsghXB5CpaBK2WQDoUv53AyC0eZDDIB8bawqapKere1tpLVxcVZlIBkVh+vog8hp
	A59R14dfKie+Yfr4EeFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iexiy-00018Y-7q; Wed, 11 Dec 2019 08:52:00 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iexiw-00017g-7N
 for linux-i3c@lists.infradead.org; Wed, 11 Dec 2019 08:51:59 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBB8pUsY018274; Wed, 11 Dec 2019 00:51:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=ohnG1Fkq5SfUtnQgtPfcw52DXwDOnkV86e+e8lqHkO0=;
 b=YDFZhM+1lhfS9UwbYCXIN5wJZBYwiuoGAVDL3fijK/m4YCN1zV8fgEMmkUtAIUhuZeYI
 Yzu8wnHU3KLJQAiE4ikBcioDL0Iloum8l4kLszmCvt7QqDhaiqRwBHZYvQB2KnNtSH1g
 fw1ZZlJ18oeX/4+Jvs551B/3HUjbPOLN7WCFsFbPuqpXgVDn505hUcp5/9vDSAw160Mf
 UETuMqtLsemMx+rJEMgONoEmsW/etPxMUzoHjVSuQxsR1WxIE5tZ1VsUhFD9CxpOl2Lg
 nBOCSGgain5cfR288f+j6aDTF+8BR1/nxNcCHpSt7l0JxCfxxjN0rpXmMmwNYazKPAWM Ng== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra70ddex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 00:51:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0EuQy2IK8zcLM+gPNXVnc3FSiQjC3+nQO+CN+IkQmnqn7JIvJ7/s3v8RH9N+b2HRAbZ1kp/ztSetguboozMBo7bzsKYkoBCiUspkZro3HxXWcZsklSnarVtAA2DWzW67oowsm/EHDJs/Aftlkj6vSZC3RUPafeeTmOyota/0xRTmaMSVTiTmbQ/uTi0svDSGF8XmNJ4lcBmT3kE+LJjt1xhfbZExmcidaqc/jukv9hBI1BMxhhvKOKw92gm/xZb1YzdYzPJsiWyNTytAqEtOtSJ2ruwGbtYF6skQCcYURurG7s2uRVP7HDKgeMOPTPNqAv+kBqWTXgB/mXHdETH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohnG1Fkq5SfUtnQgtPfcw52DXwDOnkV86e+e8lqHkO0=;
 b=VRv887dWh6rtTd6a/hJY4PRiO/rX+EeCAedrXTU0PIGJbbR/g3TYTlG773+4B4VXT8S0IVwBkCAwGrtFQm9mRaQVPO5Zu1Cb9eGM4K58BG5AUcz0yQhObLamNqwlxZnZiEtbl8GOBsmut7TyZBTjXzfmLRt4C3zz2EWnL1whp5/chXKnqhRJaU1Yqq7j1gEv7xne0yCjbVM+zhB8yFyVFUzGJXrHvP2GqZCxD6dt+bvgHTQZ1Ep3s83TKQxoXdJwdUxnEdm0X7B4fg4qaowMZK8fh/cq3aY1sN9LXDi9WX7cGYqTmrf9HjXwMcpq050VXtbZiGkYQTxtxvIgwWZWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohnG1Fkq5SfUtnQgtPfcw52DXwDOnkV86e+e8lqHkO0=;
 b=32nAGmLSfi25LjmiQeR9owTfRWrQIqP1H7BzJcdKTHIhMKqdd9faeS1cQ3ZrHgmTdVzCft/idUZkroeSPUs3YagShU38CEOdZRH6VOnn85HJo5AZgH2XFyAGy/Rgc94h/HdkMVN+kpsOGmJ0XJbTeEz2jNUz575vhqALsJqGp1M=
Received: from SN4PR0701CA0028.namprd07.prod.outlook.com
 (2603:10b6:803:2d::29) by BYAPR07MB6278.namprd07.prod.outlook.com
 (2603:10b6:a03:11b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17; Wed, 11 Dec
 2019 08:51:52 +0000
Received: from BN8NAM12FT006.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::207) by SN4PR0701CA0028.outlook.office365.com
 (2603:10b6:803:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 11 Dec 2019 08:51:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BN8NAM12FT006.mail.protection.outlook.com (10.13.183.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 08:51:51 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xBB8ppUK031035
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 11 Dec 2019 00:51:51 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 00:51:50 -0800
Date: Wed, 11 Dec 2019 09:51:47 +0100
From: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 2/6] i3c: master: pre-reserve boardinfo->init_dyn_addr
 when available
Message-ID: <20191211085146.GA10780@global.cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
 <20191210101502.8401-3-pgaj@cadence.com>
 <CH2PR12MB4216FBF6BA2155A47C76D180AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216FBF6BA2155A47C76D180AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(36092001)(189003)(199004)(70206006)(66574012)(1076003)(70586007)(316002)(246002)(76130400001)(6666004)(6286002)(2906002)(356004)(8936002)(478600001)(107886003)(55016002)(8676002)(956004)(26826003)(86362001)(186003)(7696005)(26005)(33656002)(6916009)(5660300002)(336012)(426003)(7636002)(16526019)(4326008)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR07MB6278; H:sjmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3a8091-7965-4aee-b6dc-08d77e175de8
X-MS-TrafficTypeDiagnostic: BYAPR07MB6278:
X-Microsoft-Antispam-PRVS: <BYAPR07MB6278F3196D15FA1E6D46EE8CC25A0@BYAPR07MB6278.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKu8K+7KGuyknPsMiUinp3qwzn2OtSTzYRmon1RJWczhM9FToVviTRqOYBzbaliVs+h9FT7kLD0JyjqY17vszGlgVmOGZv6CNEg9NGRvO/a+UJPlHZbCMU12Gf68oMLS+KMj++ELcq2PHWe9LphPY3aNALKrEwlV9DquC/4IAwQr+fCncVew3E1LrXhkiWhHOnXHStd5FXSfLlyUCVrJ5cE50JfeeRNW8sYcjtbL2iXVdkXJi8LY35qpv/dOWgN/4dYHiZpLbYf9L2MTNiy+IFs2/7sAv9ENXxnpV/A0oNKZBU2r7Y9AtDLDj5yTVV6lXCfFSEgy36VWdxVDSVECe0x4ZO+0ic0888mreT/iCBZlzIIcsvEG15QUTNai1Syvux7pDa8oGeSvFr9C4UOpPv/DUT5k95kaxiPA1KtE8SjG0xmBFv8RRc73AMUe4ZS0ZIVYpeRnJjx6xzUuRIEBzm1HzFBAHxrhy4G+gLHxumViC2fL/SDV4UKZvZAAQ/1Y
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 08:51:51.9783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3a8091-7965-4aee-b6dc-08d77e175de8
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB6278
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_01:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=2 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_005158_281744_DF4122DD 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgVml0b3IsCgpUaGUgMTIvMTAvMjAxOSAxNToyNCwgVml0b3IgU29hcmVzIHdyb3RlOgo+IAo+
IEhpIFByemVteXPFgmF3LAo+IAo+IEZyb206IFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNl
LmNvbT4KPiBEYXRlOiBUdWUsIERlYyAxMCwgMjAxOSBhdCAxMDoxNDo1OAo+IAo+ID4gSXQgbWF5
IGJlIHRoZSBjYXNlIHRoYXQgU0VUREFTQSBmYWlscyBmb3Igc29tZSByZWFzb24uIFJlc2VydmUK
PiA+IC0+aW5pdF9keW5fYWRkciB3aGVuIGl0J3MgZGVmaW5lZCB0byBwcmV2ZW50IGFzc2lnbmlu
ZyB0aGlzIGFkZHJlc3MKPiA+IHRvIGFub3RoZXIgc2xhdmUgZGV2aWNlLiBUaGlzIHdheSB3aGVu
IGRldmljZSBzaG93cyB1cCB3ZSBkb24ndAo+ID4gaGF2ZSB0byByZS1hc3NpZ24gYWRkcmVzc2Vz
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5j
b20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2kzYy9tYXN0ZXIuYyB8IDggKysrKysrKy0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4g
PiBpbmRleCA1YzA2YzQxZTY2NjAuLmZhYjZlMDYwOWZjYSAxMDA3NTUKPiA+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4gQEAgLTEy
NjMsNyArMTI2Myw4IEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJfcHV0X2kzY19hZGRycyhzdHJ1
Y3QgaTNjX2Rldl9kZXNjICpkZXYpCj4gPiAgCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfRlJFRSk7
Cj4gPiAgCj4gPiAgCWlmIChkZXYtPmJvYXJkaW5mbyAmJiBkZXYtPmJvYXJkaW5mby0+aW5pdF9k
eW5fYWRkcikKPiA+IC0JCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0dXMoJm1hc3Rlci0+YnVz
LCBkZXYtPmluZm8uZHluX2FkZHIsCj4gPiArCQlpM2NfYnVzX3NldF9hZGRyX3Nsb3Rfc3RhdHVz
KCZtYXN0ZXItPmJ1cywKPiA+ICsJCQkJCSAgICAgZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2Fk
ZHIsCj4gPiAgCQkJCQkgICAgIEkzQ19BRERSX1NMT1RfRlJFRSk7Cj4gPiAgfQo+ID4gIAo+ID4g
QEAgLTE2NzUsNiArMTY3NiwxMSBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJfYnVzX2luaXQoc3Ry
dWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKQo+ID4gIAkJCQlyZXQgPSAtRUJVU1k7
Cj4gPiAgCQkJCWdvdG8gZXJyX2RldGFjaF9kZXZzOwo+ID4gIAkJCX0KPiA+ICsKPiA+ICsJCQkv
KiBSZXNlcnZlIHRoZSBzbG90LiAqLwo+ID4gKwkJCWkzY19idXNfc2V0X2FkZHJfc2xvdF9zdGF0
dXMoJm1hc3Rlci0+YnVzLAo+ID4gKwkJCQkJCSAgICAgaTNjYm9hcmRpbmZvLT5pbml0X2R5bl9h
ZGRyLAo+ID4gKwkJCQkJCSAgICAgSTNDX0FERFJfU0xPVF9JM0NfREVWKTsKPiA+ICAJCX0KPiA+
ICAKPiA+ICAJCWkzY2RldiA9IGkzY19tYXN0ZXJfYWxsb2NfaTNjX2RldihtYXN0ZXIsICZpbmZv
KTsKPiA+IC0tIAo+ID4gMi4xNC4wCj4gCj4gSW4gbXkgZXhwZXJpZW5jZSB3ZSBzaG91bGQgcHJl
LXJlc2VydmUgYWxsIERUIERBIGVudHJpZXMgYW5kIG5vdCB1c2UgdGhlbSAKPiBkdXJpbmcgdGhl
IEVOVERBQSBmb3Igc2FmZXR5IHJlYXNvbnMuCj4gVGhhdCB3b3VsZCBiZSBvbmUgb2YgbXkgbmV4
dCBzdGVwcyBpbiB0aGlzIHBhdGNoIHNlcmllcy4KCkFjdHVhbGx5LCBJIHJlc2VydmUgRFQgREEg
YWRkcmVzcyBhYm92ZS4gVGhlIG9ubHkgdGhpbmcgSSB3aWxsIHJld29yaywgSQp3b24ndCBmcmVl
IHVwIHRoZSBhZGRyZXNzLiBUaGF0IHdpbGwgYmUgZG9jdW1lbnRlZCBpbiB0aGUgY29kZS4KCldl
IGNhbiByZXdvcmsgaXQgbGF0ZXIgaWYgcmVhbGx5IG5lZWRlZC4KCj4gCj4gQmVzdCByZWdhcmRz
LAo+IFZpdG9yIFNvYXJlcwo+IAoKLS0gCi0tIApSZWdhcmRzLApQcnplbWVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
