Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD90AC43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B030D20637
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eINhzuPm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="O9B3aDdR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="3zr6Uz0I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B030D20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6guiXIhNAR1iH1YTtJU8BWssD3L5zcOXXIUi6txVcDM=; b=eINhzuPmsmPc0w
	cnSiMFnGQJ6kAw+AnqAf7Qsa8hf8gnaLXtZddse52aJSgNHv128HrcgxGyFdvDNA8YdLBjb6cCbQF
	XM6GBw0P7RzF27V4uuBXleNasWgIrtvJkA8WhRbUNr6UxZomgUNpmBk6Zfw3sYVIZ2uZMq9x1vvu1
	Vqw6PVDVIYW66DCiBzds1mZwkFFuY9usYoV/iPChm+avpkhdyg/8MHkKFNXR9A+vEiqBOuU7Lr2/5
	Q1ZMx4RBHjUwqn3JhRjXxz6SNgp8lwc+WeqE8PupkH/IdjqhCKnWPN5aOkX4VaBvQUm0xjii5PO6M
	Z6FfUpOjw9+K7Fec3G+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegj1-0000Wt-TC; Tue, 10 Dec 2019 14:42:55 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegiy-0000Ur-78
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 14:42:54 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAEbMwt032762; Tue, 10 Dec 2019 06:42:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=PbA4rJ6/NhE7j4MQhQfGy6Z6I7Ag3HdmV25PFoyG/xM=;
 b=O9B3aDdRww1ipw8YQQIf/EO+V3Jzk8Y9edKIbjOU4Cltxlw+fI8IEXJRe9vThDQ7b2Ys
 y1jwHMXhL2HtOMvZO2PAqG6Eb4AQlt5GtWNQjvI3HLmf7jdiZyflZsAycL5y/jnqF1uk
 VXmp+BDPWLDhW7RAvFVh1rYkuVf0N8Nah3iviAF9v2uKSt8L8JxmM3bgTdjGjo/fesHg
 sPYc0gbUrBHQTnC4wOYpmvQYdYF0UExIL4XFTYFvD/4LuJeVYcYtjyCUqA7OmJIUpT2x
 rVDc+xAvqgDVitcEcM0g98iU29w6Zr/8NfRiAWLHY0Zx/ADY+g2V1Qe+9Qtgm4c9VQMT kw== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra70a481-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 06:42:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQloRpuUqFUG8FNdRK7y8EdfMPmX6HsdtAVwjMcyn6CPiMisbGmrnCGxYrvH1ay65zoxFosgBH2DEUtEdFgNd0cT68ygacP7UGX/3Ut9gYbG6vehQD+QsnsnWJN6DmbxKI24kf23TbxHMJZ/l+XoX44ZxHmOEhVYjVmggLSmLck/wVjNb10+/A6SGVRIIkZXyTbdm2Y8KIZiKy+EAMoYxN9siaw96v2mDhvVgRkszA0+Amg9CYrG4JJirKTazz0Hptz4+qKoGrHpp/EPswwk1UCbyx4DiSzSDUS7iQ6ReFt3pf7zVoYBF5lcdFlCQmuwWd1ccclzYruHbSZ+6FqgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbA4rJ6/NhE7j4MQhQfGy6Z6I7Ag3HdmV25PFoyG/xM=;
 b=IguE5MCSV6GrdKaO+ZN/boX/h78YMuEuYcPBkm97Lzc1IhNfEbg53SdnM33CUaXMjtHWsXuCcz32qFtRdf9TL/otvMG8Mz/lp3P/ch12pyAX4ypQxjORI0Adh7BYzQl9M4ptuXQZigUSNPAG1SZe3Yp5YT+x3rOpzCE4dhNj3VbJ3OYYqMFnqfIEpJZ+1eHrG3hckk9Fol1mljgfY0f0hAoVSE2De7gWD7wxCY28H1iHg9ujqHcAQah8Hhej+qUyLll96xEM0SRdV9IynpzNGFiOSqTuxzANHep6qQaOKVrgTx17kjFTJS+NZJ9ilDeNFORBmunK8p8Xho6IK6jWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=collabora.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbA4rJ6/NhE7j4MQhQfGy6Z6I7Ag3HdmV25PFoyG/xM=;
 b=3zr6Uz0Ij8m3pydUBFM/2wwy3zPpZfljZepWQU1kHbWwMf1NhZyQs1kpQPHMqPqpqe9JryeJcQyKuGFoevVZj0na5NlT2ZAAYEcWQEWiVRzlvmQECXyZ9s7cjDCtTGPY2Rxb2pDWQCbMlYA2x02kQ8zPpsaCNL0wSy75eHDkWsc=
Received: from CO2PR07CA0073.namprd07.prod.outlook.com (2603:10b6:100::41) by
 SN2PR07MB2703.namprd07.prod.outlook.com (2603:10b6:804:8::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Tue, 10 Dec 2019 14:42:42 +0000
Received: from BN8NAM12FT068.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::203) by CO2PR07CA0073.outlook.office365.com
 (2603:10b6:100::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Tue, 10 Dec 2019 14:42:42 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 BN8NAM12FT068.mail.protection.outlook.com (10.13.182.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 14:42:40 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id xBAEgbUe116703
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 06:42:38 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 06:42:36 -0800
Date: Tue, 10 Dec 2019 15:42:33 +0100
From: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH] i3c: make sure the PID is set before registering the
 device
Message-ID: <20191210144232.GA31515@global.cadence.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
 <20191209104711.5a549d31@collabora.com>
 <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191209132616.22ba009c@collabora.com>
 <CH2PR12MB4216B9AF8D7BDD7E3A950E9CAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216B9AF8D7BDD7E3A950E9CAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(36092001)(51444003)(189003)(199004)(6916009)(8936002)(1076003)(478600001)(66574012)(6666004)(81166006)(8676002)(356004)(81156014)(33656002)(426003)(2906002)(55016002)(316002)(5660300002)(36906005)(7696005)(956004)(6286002)(186003)(16526019)(70206006)(54906003)(86362001)(26005)(70586007)(336012)(4326008)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN2PR07MB2703; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0789651-9d96-433a-8f2a-08d77d7f3574
X-MS-TrafficTypeDiagnostic: SN2PR07MB2703:
X-Microsoft-Antispam-PRVS: <SN2PR07MB27031A3742D1E335147FCD22C25B0@SN2PR07MB2703.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGvr8fy0XjYEVPpWXu7A63BfWB3AVxaShFTf3CFhkOvSAyfsTXxNTCV0T9GaURHkZDmiHYDx3fC7GqgztB8DQtMRQsSyf+hw9/ODG9j1QJEZruMsEHQoVRkXTG9dJOzK/SOfDqjU5lTWlvLJ1lSVjSrzrlzsY1AXZdubOb2Y5vuydHNaXhFWRG0eFx852RX8ndC+pcz4pSwCGTAoteKr6WrTy5+ItHtj1DERJ1tplCPVda7anJrsEIOjhGpStwVmqomDRhUFPUi+PwH8A76Rs0Deg5TjfJ1HqQMtxeQcS7gXIzr9ZLti5fLdqn336JasWqfcSm5JOBTEiYchcdD1zz+q1I8nVljV+xherZYEk5TCEStxvk9o4PeRQgp1HIrF7DNiJdsOrpUAF9KL75FMKEBm1IH0uERM47ZPidtBi3C7bmP/ZZuxT9PUTUhg2l67lRw+7HE2P1BIIMox0GiI3rCIBV2lPGztg/cUFD2yrI0X3GiI1CXf2ZOKri5CjsRvA9hVc0wTkjLl8xeDv/KFin3drqdqDrAfjZMhGJbKw8/aNlI7wWGzX7tyBDD92mKW
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 14:42:40.5993 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0789651-9d96-433a-8f2a-08d77d7f3574
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR07MB2703
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_03:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_064252_329605_B3B23966 
X-CRM114-Status: GOOD (  26.46  )
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgVml0b3IsCgpUaGUgMTIvMTAvMjAxOSAxNDoyOCwgVml0b3IgU29hcmVzIHdyb3RlOgo+IAo+
IEhpIEJvcmlzLAo+IAo+IEZyb206IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+Cj4gRGF0ZTogTW9uLCBEZWMgMDksIDIwMTkgYXQgMTI6MjY6MTYKPiAKPiA+
IE9uIE1vbiwgOSBEZWMgMjAxOSAxMjoyMDowMyArMDAwMAo+ID4gVml0b3IgU29hcmVzIDxWaXRv
ci5Tb2FyZXNAc3lub3BzeXMuY29tPiB3cm90ZToKPiA+IAo+ID4gPiBIaSBCb3JpcywKPiA+ID4g
Cj4gPiA+IEZyb206IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+Cj4gPiA+IERhdGU6IE1vbiwgRGVjIDA5LCAyMDE5IGF0IDA5OjQ3OjExCj4gPiA+IAo+ID4g
PiA+IE9uIFN1biwgOCBEZWMgMjAxOSAxNToxODozNCArMDEwMAo+ID4gPiA+IFByemVteXPFgmF3
IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gICAKPiA+ID4gPiA+IEZyb206
IFByemVteXNsYXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBQ
cm92aXNpb25lZCBJRCAoUElEKSBpcyB0aGUgdmFsdWUgd2l0aCB3aGljaCBkZXZpY2UgZHJpdmVy
cyBhcmUKPiA+ID4gPiA+IG1hdGNoZWQuIEkgY2hlY2sgdGhlIHZhbHVlIGJlZm9yZSByZWdpc3Rl
cmluZyB0aGUgZGV2aWNlLgo+ID4gPiA+ID4gICAKPiA+ID4gPiAKPiA+ID4gPiBDYW4gdGhpcyBz
aXR1YXRpb24gKGhhdmluZyBhIGRldmljZSB3aXRoIGEgREEgYnV0IHdpdGhvdXQgYSB2YWxpZCBQ
SUQpCj4gPiA+ID4gaGFwcGVuIHJpZ2h0IG5vdyBvciBpcyB0aGlzIHNvbWV0aGluZyB5b3UgbmVl
ZCB0byBzdXBwb3J0IHNlY29uZGFyeQo+ID4gPiA+IG1hc3RlcnMgd2hvIHJlY2VpdmUgZGV2aWNl
IERBICh0aHJvdWdoIERFRlNWTFMpIHdpdGhvdXQgYmVpbmcgYWJsZSB0bwo+ID4gPiA+IHF1ZXJ5
IGV4dHJhIGluZm9ybWF0aW9uIHVudGlsIHRoZXkgb3duIHRoZSBidXM/ICAKPiA+ID4gCj4gPiA+
IFRoaXMgaXMgdGhlIHVzZSBjYXNlIHdoZXJlIGEgZGV2aWNlIGZhaWxzIHRoZSAKPiA+ID4gaTNj
X21hc3Rlcl9wcmVfYXNzaWduX2R5bl9hZGRyKCkgYW5kIEkgYWxyZWFkeSBtZW50aW9uIGl0IG9u
IFsxXS4KPiA+ID4gSSBzdGlsbCB0aGluayB0aGUgYmVzdCB3YXkgaXMgdG8gZGV0YWNoL2ZyZWUg
dGhlIGRldmljZXMgdGhhdCBmYWlscyAKPiA+ID4gZHVyaW5nIGkzY19tYXN0ZXJfcHJlX2Fzc2ln
bl9keW5fYWRkcigpLgo+ID4gCj4gPiBBbmQgSSBkaXNhZ3JlZSAoSSBnYXZlIG15IGFyZ3VtZW50
cyBhbHJlYWR5LCBzbyB3b24ndCByZXBlYXQgdGhlbQo+ID4gaGVyZSkuCj4gCj4gU29ycnkgQm9y
aXMsIGRpZCB5b3UgZ2l2ZT8gSSBhc2sgeW91IHNldmVyYWwgdGltZXMgd2h5IHRvIGtlZXAgbm9u
IERBIAo+IGRldmljZXMgYXR0YWNoZWQgdG8gdGhlIGJ1cywgeWV0IHlvdSB3YXNuJ3QgYWJsZSB0
byBnaXZlIG1lIGEgdGVjaG5pY2FsIAo+IHJlYXNvbi4gRXZlbiBmcm9tIGRldmljZSBtb2RlbCB5
b3Ugc2hvdWxkIGtlcHQgdGhlbS4KCkkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgdGhlbSBiZWNhdXNl
IGZyYW1ld29yayBzaG91bGQgc3RpbGwgaGF2ZSB0aGUKaW5mb3JtYXRpb24gYWJvdXQgYWxsIHRo
ZSBkZXZpY2VzLiBXZSBhbHJlYWR5IGRpc2N1c3NlZCB0aGF0LCByaWdodD8KRXNwZWNpYWxseSwg
d2hlbiB3ZSBoYXZlIHRvIGRlYWwgd2l0aCBncm91cCBhZGRyZXNzZXMgc29vbiwgaXQncyBiZXR0
ZXIKdG8ga2VlcCB0aGVtLgoKPiBIb25lc3RseSwgSSdtIHN0YXJ0aW5nIGFzayBteXNlbGYgaWYg
dGhpcyBpcyBzb21ldGhpbmcgYWdhaW5zdCBiZWNhdXNlIAo+IGV2ZXJ5IHRpbWUgdGhhdCBJJ20g
dHJ5aW5nIHRvIGltcHJvdmUgc29tZXRoaW5nIEkganVzdCBzZWUgZGlmZmljdWx0eSAKPiBmcm9t
IHlvdXIgc2lkZS4KCkRvbid0IGZvcmdldCB0aGF0IG15IHBhdGNoZXMgYXJlIGFjY2VwdGVkIGFm
dGVyIDZ0aCwgN3RoIHZlcnNpb25zLiBJCnRoaW5rIHRoYXQgaXQganVzdCBzaG91bGQgd29yayBs
aWtlIHRoYXQuIFRoaXMgbWFrZXMgdGhpbmdzIGJldHRlciA6KQoKPiAKPiA+IENhbiB3ZSBtb3Zl
IG9uIHBsZWFzZT8KPiAKPiBJIHRoaW5rIHlvdSBzaG91bGQgc3RhcnQgbGVhcm5pbmcgdG8gbGlz
dGVuIHRoZSBvdGhlciBhbmQgaGF2ZSB0aGUgCj4gZ3JlYXRuZXNzIHRvIGFjY2VwdCB0aGUgb3Ro
ZXJzIGV4cGVyaWVuY2UgYW5kIG9waW5pb25zLiBXaXRoIHlvdXIgCj4gZXhwZXJpZW5jZSB5b3Ug
c2hvdWxkIGFscmVhZHkgbGVhcm4gdGhhdC4KPiBUaGUgcHJldmlvdXMgcGF0Y2ggbWFrZXMgYWxs
IHRoZSBzZW5zZSB5ZXQgeW91ciByZXNwb25zZSB3YXMgLSBJIGFtIG5vdCAKPiBjb252aW5jZWQu
IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBhIHByb3BlciBqdXN0aWZpY2F0aW9uPyBBdCBsZWFzdCB0
ZXN0IAo+IHdoYXQgSSBzcGVuZCB0aW1lIHRvIGRvPwo+IAo+ID4gQ2FuIHlvdSBzZW5kIGEgbmV3
IHZlcnNpb24gdGhhdCBkb2VzIHdoYXQKPiA+IEkgc3VnZ2VzdCwgb3Igc2hvdWxkIEkgYXNrIFBy
emVtZWsgdG8gZG8gaXQ/Cj4gCj4gRG9lcyB0aGUgZXRoaWNzIGFwcHJvdmUgc3VjaCBhdHRpdHVk
ZT8gRG9uJ3QgeW91IHNlZSB3aXRoIGtpbmQgb2YgCj4gYXR0aXR1ZGUgeW91IGFyZSBqdXN0IHB1
dHRpbmcgcGVvcGxlIGF3YXkgb2YgdGhpcyBzdWJzeXN0ZW0/Cj4gCj4gPiAKPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1pM2MgbWFp
bGluZyBsaXN0Cj4gPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cHM6Ly91
cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2xpc3RzLmluZnJhZGVh
ZC5vcmdfbWFpbG1hbl9saXN0aW5mb19saW51eC0yRGkzYyZkPUR3SUdhUSZjPURQTDZfWF82SmtY
Rng3QVhXcUIwdGcmcj1xVnVVNjR1OXg3N1kwS2QwUGhES19scHhGZ2c2UEs5UGF0ZUh3amJfRFkw
Jm09Y1h5UENITzJ2aGN5RDNhTi1MbnFPcXpvZGJCOWctdXRKWGVXT1FSa0ptayZzPW9kcnRZaGIt
SWFLLWRmVHppMXA3VHdIMllKY25aM1JTZE5OcktKalhGZE0mZT0gCj4gCj4gQmVzdCByZWdhcmRz
LAo+IFZpdG9yIFNvYXJlcwo+IAoKLS0gCi0tIApSZWdhcmRzLApQcnplbWVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1pM2MgbWFpbGluZyBs
aXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
