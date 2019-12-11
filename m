Return-Path: <SRS0=S0Sy=2B=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2955C43603
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Dec 2019 09:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0EC320637
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Dec 2019 09:33:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkbF4CzV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="XcfdRuN4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="4pisUwhp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0EC320637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGcT8qSxp0Opbbz2b2D8RmNCAP6oLnsy9mp10DsOplk=; b=bkbF4CzV+qw5EB
	73D65LUNgQFsS73PU83aponP9Q1OUAfnYu89Hlp940I69CRHQIYRAlXyMUtVTc0OLiFb1ReLi2U1f
	uIooUXMsvlba5DBgJ3SF20bF2SoztAhE3VYtIjK6LIyHgE1Vsn2xF4BpIKZ5WQxh1VyiD5yoPGbjh
	lr4PVorRNA3GO2SexKab0KiPDEUOR4t0mDAHFpQO6bX/mD4+YNWJSvIOXQLIhx1ArJFcHDxXGUWbT
	Hq5LgK9ZoAlquLPi1I2o2edEMx93jLmvQpH8tefPSwxRtC8HWhOpnFuARVuFzkeXU1TRbDQUAwVSm
	JgnA501nwaFSbhZDhVdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieyNI-0004ET-OR; Wed, 11 Dec 2019 09:33:40 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieyNE-0004Ad-Sa
 for linux-i3c@lists.infradead.org; Wed, 11 Dec 2019 09:33:39 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBB9UEwk014402; Wed, 11 Dec 2019 01:33:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=m120wfI7XWyk6Mmgq6yQBw1RQAo9cZrx+t9SMjQsImA=;
 b=XcfdRuN4EB6gF3YTMPZq5ItZY7UnPTUaG01l386/ihJXfmEFYx/x041c8UhZOzA63iGY
 LdvZPQg+F1uK5g+kE8Z9jUABqwjHi8laKNG+ziLdygl5yhkuJWF6h8WV35ZPi7ZrUQhL
 xUVpvSUkB3NGXSoZyRARa15ui2aGrzdBciGbzRDO0W05yvW6nY0NhwXaTqePkGPjVK5i
 0XOUW7OSHaAtBBU6/LX+u9BBTheBt6eIa5nG8wrVQ1ONusXdTmS8+aeiLln3dH+DR36h
 ylj55o1e2vR9lZ4C6GLVl8Tdldas7rj0+ZvaJt2hIHJMqjWl17I7MBLLsvxoHS1mtDAh /A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wr9dfnkyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Dec 2019 01:33:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/EaDpuXTQtTW9XEhi1HpWbnkrsKowv1BX8hFrDVWGCG2IhnaFxVoiJ+XsTDfbdZUDiZpKYkaYX/zlmA8vMsbiVYQlGN6FAagW9ZJUxaIhxlgHIq2sq9qe2POZYzd7VNlzIojUYxcJES90esIpzJLBR5gG8PlwU8rrcEDhBSvo4LH2VrogKa/jfi33CQRiMhtFEEkRpWwYvFzekw/j+L8xJBozHb0B2feschFEEOl6z+pmrQxFHEOqeqKWlZ1kQl4S7kCJJXYD9bdUNl8pM+mL6/SFpyH0T0uvf2SINut3YxadJzx9K3xtysoAbNE0U65fkYiL5lbwsFaGi1IhXiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m120wfI7XWyk6Mmgq6yQBw1RQAo9cZrx+t9SMjQsImA=;
 b=jIYNVvt+ro1Y/1jhCRy/3rjt7w+n0pg3m+xXhuu+R8IRrv3cFFAqvG9Qxpnhx5ozbyTPJ2v2Fv7Sded9kkYBHCO0w+fXtvIoel6ngm6LJ9VdE8NhleIDLvRhOe67Ol2DjQ4QnTVq0CMVcAlmU78dX2ITsB1FxI829TjCCMQji89IN+YIiL32JYNjabstcRu2dvMZsA8GzIjAzPoX497eGOP6PVEemhiEJilvAz5RH4Js+nBJyPSBa9dp2k+MMhN7Nfp/K2Gg37sV1yEhswsEQ/RUAbrLALkIWOC7B7gKJs+J1B+Q9NKXbBZRwEj/7z2yqB6jyd5Ysw05/Ep+IJujcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=collabora.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m120wfI7XWyk6Mmgq6yQBw1RQAo9cZrx+t9SMjQsImA=;
 b=4pisUwhpD6k44etvGp8DoPFlVsAlNKsAM+pn2MWvXgtV7iStmwI0W9QiewhTkhjpxSlQuQd8fyO68Obx42ZLPG3uJMhIqsmOvnDqvgvXnGU07z+T6RBo1g94fQv8j59lCp+xjZbCL58ls/uSwvdiO3jDovwbiN0B5TAcJozjSiM=
Received: from DM6PR07CA0037.namprd07.prod.outlook.com (2603:10b6:5:74::14) by
 DM6PR07MB4730.namprd07.prod.outlook.com (2603:10b6:5:a1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 09:33:26 +0000
Received: from DM6NAM12FT032.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::205) by DM6PR07CA0037.outlook.office365.com
 (2603:10b6:5:74::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.14 via Frontend
 Transport; Wed, 11 Dec 2019 09:33:26 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 DM6NAM12FT032.mail.protection.outlook.com (10.13.178.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 11 Dec 2019 09:33:24 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id xBB9XMF6175189
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 01:33:22 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 01:33:21 -0800
Date: Wed, 11 Dec 2019 10:33:18 +0100
From: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH] i3c: make sure the PID is set before registering the
 device
Message-ID: <20191211093316.GB10780@global.cadence.com>
References: <20191208141834.10310-1-pgaj@cadence.com>
 <20191209104711.5a549d31@collabora.com>
 <CH2PR12MB42164BC8E6A616AF111D45B1AE580@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191209132616.22ba009c@collabora.com>
 <CH2PR12MB4216B9AF8D7BDD7E3A950E9CAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191210144232.GA31515@global.cadence.com>
 <CH2PR12MB42165CB07AB08627BC0477BBAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB42165CB07AB08627BC0477BBAE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(36092001)(189003)(199004)(55016002)(33656002)(956004)(86362001)(6916009)(26005)(1076003)(186003)(966005)(426003)(336012)(4326008)(478600001)(16526019)(2906002)(6286002)(36906005)(70206006)(8676002)(7696005)(54906003)(5660300002)(66574012)(70586007)(316002)(356004)(8936002)(6666004)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4730; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65309d85-2efc-4ce8-6165-08d77e1d2bcb
X-MS-TrafficTypeDiagnostic: DM6PR07MB4730:
X-Microsoft-Antispam-PRVS: <DM6PR07MB4730D659804510690B6C45B4C25A0@DM6PR07MB4730.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m71g4QIm0H+rt4gkvHEZ1tYsOdNq2B57DNuAfdqpPlvxVzdcAN+BfNVmlUKm81hRzXbCXnnrC4wFTayuh/a5WR7pMLkzvWH9cMMgVYwvK3R/4w4YnPBq9e6L7hEtAJ+eKQ6tyGKRhwMu2eXtZjYlx7gIAPZu8X5Zl4auCJAasAG1o+n/jk6g0807lVdjqKboIFVIKgZBLikpSRPyle63PFKT2zi0+XpozzZfooacmBgkNrGxD5FbhOjkf8JuYRZ4jhYKGu8n81fvACJKkh8Rve0sluM3FuFSpLrCOInUvsUOjjef3HAD15T55Mg3jXjc/MJVy/B/zqSJm1W4ejugcLL5HNFzmAG9pDvbz1ef0cHIFo6wrZOyANaOidaiefXtbWPG0rH3anj7+PhCVLtF/DwI6tP9hCDnvCMzia4HC7dm1xvfvBKuGnf9WJ6CHbFEOf+7tNpkm3tP5q3B/ap+pVrOpdWfbHMpnoHbyvo/eW763AaPVJWETvAGmqEhhubz6XRyO9sRwWGEO+06cg0CeBc2+RsRTTcewyJHchIfWEY=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 09:33:24.8964 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65309d85-2efc-4ce8-6165-08d77e1d2bcb
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4730
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_02:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912110083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_013337_122334_A5291A37 
X-CRM114-Status: GOOD (  42.27  )
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

SGkgVml0b3IsCgpUaGUgMTIvMTAvMjAxOSAxNToyMywgVml0b3IgU29hcmVzIHdyb3RlOgo+IAo+
IEhpIFByemVteXPFgmF3LAo+IAo+IEZyb206IFByemVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNl
LmNvbT4KPiBEYXRlOiBUdWUsIERlYyAxMCwgMjAxOSBhdCAxNDo0MjozMwo+IAo+ID4gSGkgVml0
b3IsCj4gPiAKPiA+IFRoZSAxMi8xMC8yMDE5IDE0OjI4LCBWaXRvciBTb2FyZXMgd3JvdGU6Cj4g
PiA+IAo+ID4gPiBIaSBCb3JpcywKPiA+ID4gCj4gPiA+IEZyb206IEJvcmlzIEJyZXppbGxvbiA8
Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cj4gPiA+IERhdGU6IE1vbiwgRGVjIDA5LCAy
MDE5IGF0IDEyOjI2OjE2Cj4gPiA+IAo+ID4gPiA+IE9uIE1vbiwgOSBEZWMgMjAxOSAxMjoyMDow
MyArMDAwMAo+ID4gPiA+IFZpdG9yIFNvYXJlcyA8Vml0b3IuU29hcmVzQHN5bm9wc3lzLmNvbT4g
d3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gPiBIaSBCb3JpcywKPiA+ID4gPiA+IAo+ID4gPiA+ID4g
RnJvbTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+
ID4gPiA+IERhdGU6IE1vbiwgRGVjIDA5LCAyMDE5IGF0IDA5OjQ3OjExCj4gPiA+ID4gPiAKPiA+
ID4gPiA+ID4gT24gU3VuLCA4IERlYyAyMDE5IDE1OjE4OjM0ICswMTAwCj4gPiA+ID4gPiA+IFBy
emVteXPFgmF3IEdhaiA8cGdhakBjYWRlbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ICAgCj4g
PiA+ID4gPiA+ID4gRnJvbTogUHJ6ZW15c2xhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+Cj4gPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gUHJvdmlzaW9uZWQgSUQgKFBJRCkgaXMgdGhlIHZhbHVl
IHdpdGggd2hpY2ggZGV2aWNlIGRyaXZlcnMgYXJlCj4gPiA+ID4gPiA+ID4gbWF0Y2hlZC4gSSBj
aGVjayB0aGUgdmFsdWUgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBkZXZpY2UuCj4gPiA+ID4gPiA+
ID4gICAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IENhbiB0aGlzIHNpdHVhdGlvbiAoaGF2aW5n
IGEgZGV2aWNlIHdpdGggYSBEQSBidXQgd2l0aG91dCBhIHZhbGlkIFBJRCkKPiA+ID4gPiA+ID4g
aGFwcGVuIHJpZ2h0IG5vdyBvciBpcyB0aGlzIHNvbWV0aGluZyB5b3UgbmVlZCB0byBzdXBwb3J0
IHNlY29uZGFyeQo+ID4gPiA+ID4gPiBtYXN0ZXJzIHdobyByZWNlaXZlIGRldmljZSBEQSAodGhy
b3VnaCBERUZTVkxTKSB3aXRob3V0IGJlaW5nIGFibGUgdG8KPiA+ID4gPiA+ID4gcXVlcnkgZXh0
cmEgaW5mb3JtYXRpb24gdW50aWwgdGhleSBvd24gdGhlIGJ1cz8gIAo+ID4gPiA+ID4gCj4gPiA+
ID4gPiBUaGlzIGlzIHRoZSB1c2UgY2FzZSB3aGVyZSBhIGRldmljZSBmYWlscyB0aGUgCj4gPiA+
ID4gPiBpM2NfbWFzdGVyX3ByZV9hc3NpZ25fZHluX2FkZHIoKSBhbmQgSSBhbHJlYWR5IG1lbnRp
b24gaXQgb24gWzFdLgo+ID4gPiA+ID4gSSBzdGlsbCB0aGluayB0aGUgYmVzdCB3YXkgaXMgdG8g
ZGV0YWNoL2ZyZWUgdGhlIGRldmljZXMgdGhhdCBmYWlscyAKPiA+ID4gPiA+IGR1cmluZyBpM2Nf
bWFzdGVyX3ByZV9hc3NpZ25fZHluX2FkZHIoKS4KPiA+ID4gPiAKPiA+ID4gPiBBbmQgSSBkaXNh
Z3JlZSAoSSBnYXZlIG15IGFyZ3VtZW50cyBhbHJlYWR5LCBzbyB3b24ndCByZXBlYXQgdGhlbQo+
ID4gPiA+IGhlcmUpLgo+ID4gPiAKPiA+ID4gU29ycnkgQm9yaXMsIGRpZCB5b3UgZ2l2ZT8gSSBh
c2sgeW91IHNldmVyYWwgdGltZXMgd2h5IHRvIGtlZXAgbm9uIERBIAo+ID4gPiBkZXZpY2VzIGF0
dGFjaGVkIHRvIHRoZSBidXMsIHlldCB5b3Ugd2Fzbid0IGFibGUgdG8gZ2l2ZSBtZSBhIHRlY2hu
aWNhbCAKPiA+ID4gcmVhc29uLiBFdmVuIGZyb20gZGV2aWNlIG1vZGVsIHlvdSBzaG91bGQga2Vw
dCB0aGVtLgo+ID4gCj4gPiBJIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZW0gYmVjYXVzZSBmcmFt
ZXdvcmsgc2hvdWxkIHN0aWxsIGhhdmUgdGhlCj4gPiBpbmZvcm1hdGlvbiBhYm91dCBhbGwgdGhl
IGRldmljZXMuIFdlIGFscmVhZHkgZGlzY3Vzc2VkIHRoYXQsIHJpZ2h0Pwo+ID4gRXNwZWNpYWxs
eSwgd2hlbiB3ZSBoYXZlIHRvIGRlYWwgd2l0aCBncm91cCBhZGRyZXNzZXMgc29vbiwgaXQncyBi
ZXR0ZXIKPiA+IHRvIGtlZXAgdGhlbS4KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lIHdo
ZXJlIGRvIHdlIG5lZWQgaXQ/IFdlIHN0aWxsIGhhdmUgdGhlIAo+IGJvYXJkaW5mbyB0aGF0IGhv
bGQgRFQgaW5mb3JtYXRpb24gd2hpY2ggaXMgd2hhdCB3ZSBuZWVkLgoKQXMgTUlQSSAxLjEgaW50
cnVkdWNlcyBncm91cCBhZGRyZXNzIGZlYXR1cmUsIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8Ka2Vl
cCB0aGUgZGV2aWNlcyBvbiB0aGUgbGlzdCBhcyB0aGUgaW5mb3JtYXRpb24gYWJvdXQgdGhhdCBk
ZXZpY2UgbWF5IGJlCm5lZWRlZCB3aGVuIHdlIG1hbmFnZSBkZXZpY2VzIHVuZGVyIHRoYXQgZ3Jv
dXAuIEkga25vdyB0aGUgZGV2aWNlIGlzIG5vdAphZGRyZXNzZWQgdGhhdCB0aW1lIGJ1dCB3aGVu
IGl0IGpvaW5zLCB3ZSdsbCBoYXZlIHRoZSBkZXNjcmlwdGlvbgoocG9zc2libHkgd2l0aCBncm91
cCB2aXJ0dWFsIEkzQyBhZGRyZXNzKSBzbyB3ZSBjYW4gYXNzaWduIGl0IGVhc2lseS4KCj4gCj4g
SWYgYSBkZXZpY2UgZG9lc24ndCBoYXZlIERBLCB3aHkgZG8gd2UgbmVlZCBpdD8gQnkgZGVmaW5p
dGlvbiB0aGUgaTNjIGRldiAKPiBkZXNjIGlzIHRoZSBkaXNjb3ZlcmVkIGRldmljZXMsIGlmIGl0
IGRvZXNuJ3QgaGF2ZSBhbiBEQSBpc24ndCBkaXNjb3ZlcmVkIAo+IHlldC4KClllcywgSSBrbm93
LiBNSVBJIHNwZWMgZGVmaW5lcyB0aGF0IHdlIHNob3VsZCBub3QgZGVmaW5lIHNsYXZlIGxpc3QK
d2l0aG91dCBEQSBidXQgaGF2aW5nIGRldmljZXMgb3Igbm90IGluIHRoZSBzdWJzeXN0ZW0gaXMg
b3VyIGludGVybmFsCmltcGxlbWVudGF0aW9uIGFuZCBJIHRoaW5rIHdlIGNhbiBrZWVwIHRoZW0g
YW5kIG5vdCBzZXJ2ZSB0aGVtIG9uIHRoZSBidXMuCkF0IGxlYXN0IGZvciBub3csIHdoZW4gc29t
ZSBiaWcgZmVhdHVyZXMgYXJlIG1pc3NpbmcuCgo+IAo+ID4gCj4gPiA+IEhvbmVzdGx5LCBJJ20g
c3RhcnRpbmcgYXNrIG15c2VsZiBpZiB0aGlzIGlzIHNvbWV0aGluZyBhZ2FpbnN0IGJlY2F1c2Ug
Cj4gPiA+IGV2ZXJ5IHRpbWUgdGhhdCBJJ20gdHJ5aW5nIHRvIGltcHJvdmUgc29tZXRoaW5nIEkg
anVzdCBzZWUgZGlmZmljdWx0eSAKPiA+ID4gZnJvbSB5b3VyIHNpZGUuCj4gPiAKPiA+IERvbid0
IGZvcmdldCB0aGF0IG15IHBhdGNoZXMgYXJlIGFjY2VwdGVkIGFmdGVyIDZ0aCwgN3RoIHZlcnNp
b25zLiBJCj4gPiB0aGluayB0aGF0IGl0IGp1c3Qgc2hvdWxkIHdvcmsgbGlrZSB0aGF0LiBUaGlz
IG1ha2VzIHRoaW5ncyBiZXR0ZXIgOikKPiAKPiBJIGRvbid0IGhhdmUgaXNzdWUgaW4gc2VuZCBt
dWx0aXBsZSB2ZXJzaW9ucyBvZiBteSBwYXRjaGVzIGFzIGxvbmcgYXMgCj4gdGhleSBhcmUgaW1w
cm92ZWQuIEluIHRoaXMgY2FzZSwgIEkgZG9uJ3QgYWdyZWUgd2l0aCBCb3JpcydzIHJlcXVpcmVt
ZW50cyAKPiBiZWNhdXNlIGluIG15IHRlc3RzIEkgc3RpbGwgaGF2ZSBpc3N1ZXMuCj4gUGxlYXNl
IG1ha2UgdGhlIGV4ZXJjaXNlIGFuZCBjaGVjayB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgd2hlbiBh
IGRldmljZSAKPiBmYWlscyBpbiBpM2NfbWFzdGVyX3ByZV9hc3NpZ25fZHluX2FkZHIoKSBzbyBl
dmVyeXRoaW5nIGdvZXMgb2sgYW5kIHdoYXQgCj4gaXQgaXMgdGhlIGFkdmFudGFnZSBvZiBrZXB0
IGkzY19kZXZfZGVzYyBmcm9tIHRob3NlIGRldmljZXMuCgpJIGZvcmNlZCB0aGUgZXJyb3Igb2Yg
U0VUREFTQSBhbmQgdGhlbiBqb2luZWQgdGhlIGJ1cy4gRHVwcGxpY2F0ZSB3YXMKZm91bmQgYW5k
IHRoYXQncyBpdC4gV2hhdCBraW5kIG9mIGlzc3VlIHlvdSBoYXZlPyBJIGNhbiBkZWJ1ZyBpdCBv
biBteQplbmQgYW5kIHNlZSBpZiBhbnl0aGluZyBuZXcgaXMgZGlzY292ZXJlZC4KCkl0IHRoaXMg
cHJvYmxlbSBpcyByZWxhdGVkIHRvIGxhY2sgb2Ygc2xvdHMgaW4gdGhlIEhXLCB5b3UgY2FuIHJl
dXNlCmFscmVhZHkgYWxsb2NhdGVkIHNsb3QgaW4gLT5hdHRhY2hfaTNjX2RldigpIGFuZCB0aGF0
IHNob3VsZCBzb2x2ZQp0aGUgcHJvYmxlbSwgcmlnaHQ/Cgo+IAo+IEFuZCBzdGlsbCBJIGhhdmUg
aXNzdWUgb24gbXkgc2lkZS4gCj4gCj4gRGlkIHlvdSB0ZXN0IHRoZSBwcmV2aW91cyBwYXRjaD8g
RGlkIHlvdSBmaW5kIGFueSBpc3N1ZT8gSWYgc28sIHlvdSAKPiB3b3VsZG4ndCBuZWVkIHRoZSBm
aXggdGhlIGkzY19tYXN0ZXJfcmVnaXN0ZXJfbmV3X2kzY19kZXZzKCkgd2hpY2ggaXMgdGhlIAo+
IGxhc3QgaW5zdGFuY2Ugb2YgcmVnaXN0ZXJpbmcgYW4gaTNjIGRldmljZS4KCkkga25vdywgaXQn
cyBtb3JlIGxpa2UgSSdtIHByZXBhcmluZyB0aGlzIGZvciB0aGUgbmV4dCBzdGFnZSwgbWFzdGVy
c2hpcAp0YWtlb3Zlci4gSSBjYW4gaW50cm9kdWUgdGhpcyBhbHNvIHdoZW4gaW50cm9kdWNpbmcg
dGhhdCBwYXRjaHNldCBidXQgSQp3YW50IHRvIGtlZXAgbWFzdGVyc2hpcCBhcyBzaW1wbGUgYXMg
cG9zc2libGUuIEkgaG9wZSB5b3UgdW5kZXJzdGFuZAp0aGF0LiBUaGlzIHNob3VsZCBiZSBiZW5l
ZmljaWFsIGZvciBhbGwgb2YgdXMuCgo+IEkgd291bGQgYXNrIHlvdSB0byB2ZXJpZnkgaW4gdjEu
MSBzcGVjIHRoZSBDQ0NzIHRhYmxlIGFuZCB2ZXJpZnkgaWYgZml4IAo+IHRoZSBpM2NfbWFzdGVy
X3JlZ2lzdGVyX25ld19pM2NfZGV2cygpIGlzIGNvcnJlY3QgYWNjb3JkaW5nIHdoYXQgaXMgCj4g
dGhlcmUuCgpDb3VsZCB5b3UgYmUgbW9yZSBzcGVjaWZpYyBoZXJlPyBXaGVuIHlvdSBsb29rIGlu
dG8gTUlQSSBzcGVjLCB5b3UnbGwKc2VlIHRoYXQgd2UgY2FuIGhhdmUgJ3BhcnRpYWx5IGRpc2Nv
dmVyZWQnIGRldmljZXMgYnkgbGFjayBvZiBpbmZvcm1hdGlvbgppbiBERUZTTFZTLgoKPiAKPiA+
IAo+ID4gPiAKPiA+ID4gPiBDYW4gd2UgbW92ZSBvbiBwbGVhc2U/Cj4gPiA+IAo+ID4gPiBJIHRo
aW5rIHlvdSBzaG91bGQgc3RhcnQgbGVhcm5pbmcgdG8gbGlzdGVuIHRoZSBvdGhlciBhbmQgaGF2
ZSB0aGUgCj4gPiA+IGdyZWF0bmVzcyB0byBhY2NlcHQgdGhlIG90aGVycyBleHBlcmllbmNlIGFu
ZCBvcGluaW9ucy4gV2l0aCB5b3VyIAo+ID4gPiBleHBlcmllbmNlIHlvdSBzaG91bGQgYWxyZWFk
eSBsZWFybiB0aGF0Lgo+ID4gPiBUaGUgcHJldmlvdXMgcGF0Y2ggbWFrZXMgYWxsIHRoZSBzZW5z
ZSB5ZXQgeW91ciByZXNwb25zZSB3YXMgLSBJIGFtIG5vdCAKPiA+ID4gY29udmluY2VkLiBDb3Vs
ZCB5b3UgcGxlYXNlIGdpdmUgYSBwcm9wZXIganVzdGlmaWNhdGlvbj8gQXQgbGVhc3QgdGVzdCAK
PiA+ID4gd2hhdCBJIHNwZW5kIHRpbWUgdG8gZG8/Cj4gPiA+IAo+ID4gPiA+IENhbiB5b3Ugc2Vu
ZCBhIG5ldyB2ZXJzaW9uIHRoYXQgZG9lcyB3aGF0Cj4gPiA+ID4gSSBzdWdnZXN0LCBvciBzaG91
bGQgSSBhc2sgUHJ6ZW1layB0byBkbyBpdD8KPiA+ID4gCj4gPiA+IERvZXMgdGhlIGV0aGljcyBh
cHByb3ZlIHN1Y2ggYXR0aXR1ZGU/IERvbid0IHlvdSBzZWUgd2l0aCBraW5kIG9mIAo+ID4gPiBh
dHRpdHVkZSB5b3UgYXJlIGp1c3QgcHV0dGluZyBwZW9wbGUgYXdheSBvZiB0aGlzIHN1YnN5c3Rl
bT8KPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+ID4gPiBsaW51eC1pM2MgbWFpbGluZyBsaXN0Cj4gPiA+ID4g
bGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiBodHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fbGlzdHMuaW5mcmFkZWFkLm9yZ19tYWls
bWFuX2xpc3RpbmZvX2xpbnV4LTJEaTNjJmQ9RHdJR2FRJmM9RFBMNl9YXzZKa1hGeDdBWFdxQjB0
ZyZyPXFWdVU2NHU5eDc3WTBLZDBQaERLX2xweEZnZzZQSzlQYXRlSHdqYl9EWTAmbT1jWHlQQ0hP
MnZoY3lEM2FOLUxucU9xem9kYkI5Zy11dEpYZVdPUVJrSm1rJnM9b2RydFloYi1JYUstZGZUemkx
cDdUd0gyWUpjblozUlNkTk5yS0pqWEZkTSZlPSAKPiA+ID4gCj4gPiA+IEJlc3QgcmVnYXJkcywK
PiA+ID4gVml0b3IgU29hcmVzCj4gPiA+IAo+ID4gCj4gPiAtLSAKPiA+IC0tIAo+ID4gUmVnYXJk
cywKPiA+IFByemVtZWsKPiAKPiBIb25lc3RseSwgSSB0aGluayBpdCBpcyBub3QgcmlnaHQgeW91
IGJlaW5nIGludm9sdmVkIGluIHRoaXMgZXNwZWNpYWxseSAKPiBieSB0aGUgY29tcGFuaWVzIHdl
IHJlcHJlc2VudC4KCk9oLCB3ZSBhcmUgcGFydCBvZiB0aGUgY29tbXVuaXR5IGhlcmUsIGxldCdz
IG5vdCBzcGVhayBhYm91dCB0aGUKY29tcGFuaWVzIDopCgo+IEFzIEkgYWxyZWFkeSBzYWlkIGJl
Zm9yZSBJIGhlcmUgdG8gY29udHJpYnV0ZSBhbmQgaWYgSSB0aGluayBteSBzb2x1dGlvbiAKPiBp
cyBiZW5lZmljaWFsIGZvciBldmVyeW9uZSBhbmQgZG9lc24ndCBoYXZlIGEgbmVnYXRpdmUgaW1w
YWN0IG9uIG90aGVycyAKPiBkcml2ZXJzLCBJIGNhbid0IGFjY2VwdCB1bmp1c3RpZmlhYmxlIHJl
cXVpcmVtZW50cy4KCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gVml0b3IgU29hcmVzCgotLSAKLS0g
ClJlZ2FyZHMsClByemVtZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
