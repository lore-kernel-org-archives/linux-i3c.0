Return-Path: <SRS0=kfgj=2A=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C3EC43603
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31BC2077B
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Dec 2019 14:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7cpPO2i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="QiPLTWye";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="sZag/tmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31BC2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HAk3n3ZHMadMoMVq/T3A5gLat2q3miqXdy7paVm2sQ=; b=N7cpPO2iYic0SM
	U1YPlbiUECCILkBk7Wyy2XEbF09mSdDnhrwX/7OLcB80/+++Wx4bEl4SsVVuIykNuzNIC/Bb+578x
	x0bkwqZqpbckF+skBh0do8I8plOZSXrFfApchW3IXVWbpdjYLZ7qqzJWnVFXabIObk7h2+o66YdKY
	O/02vNOq7vrsrprrqOlphQRw/qEq2S0Ai557GlHTRWL+XmpBwlZKPBrwNEnOmjTMHMn6tfvstUE3y
	AVH5vTbscegZSIHn6SPZSm5t53SSXg8XYercjcJIRTpb6SbRE7tR/LslUZFEwDKTcVEJVfiAvmZGR
	rcZDnfFNqhw9AU5QQ2sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegjy-0000bi-7K; Tue, 10 Dec 2019 14:43:54 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegju-0000aw-HV
 for linux-i3c@lists.infradead.org; Tue, 10 Dec 2019 14:43:52 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAEbNpE000308; Tue, 10 Dec 2019 06:43:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=proofpoint;
 bh=6Pn8h85uwVw0ySrlINmDrYoZ5U0rU9lIw6DUtxvVpn4=;
 b=QiPLTWye/c9y7tZaXKUNRq4ehw1p79Z6hI9+KHmfvl0pesEACX7hOZkDyB8rRe743Dka
 y+2w1MgaJd97UFK3oL/HIaXp2GevQwOLcUzVrTPuhUWGZC+qjH/PBiJywKGzvSaEk3Lc
 dF83t68Zv3c1CZcwpGRjBo4UEhslgILmbVH0jYguGRW5biYYSofnzvxHjSu+2rTYvsZs
 j6KYzA6GRvWF7LAbEgs+Br45xG+/BTVpiFVmjx4NcOWPk72si/9a1YuDOT03v6Q6qPMR
 nIvTpcbn7+HOVhYqAJeRjpab5UiXjg2Hy0C3VARiUq3b1voAtCF0zBJhD6zF00k7KhHH AA== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2050.outbound.protection.outlook.com [104.47.37.50])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wra70a4b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 06:43:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pjb1NugV3tZTSKbW7j3kD69Twkiq2qMtrBbxIRQSOo87OvYhB85fTjtun29lC4G6nQwqcsKEdeFWqhChZxQLR/Y9KAKf3rHW7Q+CYl/ZSlTtDpglbn0QlLmvC5Nyw+o8q4EXZMgJ73ooJhVlAzTsERXp+3HKi0i/F+tyP33itvnhvwUUQRySigEijP/jl8qFXkuUo6OLME45b31BDs6yNA83DUQ1Ui7oK3GLK3vClW2niH8pHRceY5KSas6072Ie3wg+fuATSAVDPtoEDKJcje1kYWUVEqUiyp2/qLHip9HRYvQ9GBYMpmG21w/K4vAkT68tgcWh1BFsvmCThCUTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Pn8h85uwVw0ySrlINmDrYoZ5U0rU9lIw6DUtxvVpn4=;
 b=BZbQ09E1FuhTozwYJp1fqM8d4rDNv8hWzocj7MHe15i5chCJ7Rb8TFIk9F5ycprleLNuZhAHT2pGl9z12BKIFaGIhZe50bh8FxM/seGs6mnwzrclW3vbsngzg11+i9BUepZOEN67VrmQXWQbbDrSQDjN3YXABVSlrkG26m7WOBNPpzVW729pMdvTMmHekqkF2BisAg5WNyRHocYzNQGyvpKB1Xunfy2CHtL2yyq8ecVGgir1zMvyunqesPvTCLHNn0EMykHYBkF8J/9tlkek6c2tD92zWiYh6qn8ldoDqrwDSSOi45aEvZYWUTKLgEYeF/KLG14NTELTkTA7nue3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 199.43.4.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Pn8h85uwVw0ySrlINmDrYoZ5U0rU9lIw6DUtxvVpn4=;
 b=sZag/tmUMql0MLNl4ERXgHiddG0GJ/ZIYfrsDLpRJmtMR7sNGBftaJowBc712IHGMYtEOzukwoIdO7GkjF4cqqMfTgh4nZb7HWuW2u2mdwG6BBszvqXGkUtnokmij4xGn3EBrRLcBAnrr5XN9tRoY+SY5qt6tXDWocpeW5ajwbE=
Received: from BN8PR07CA0032.namprd07.prod.outlook.com (2603:10b6:408:ac::45)
 by BN8PR07MB6932.namprd07.prod.outlook.com (2603:10b6:408:da::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15; Tue, 10 Dec
 2019 14:43:45 +0000
Received: from DM6NAM12FT060.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::200) by BN8PR07CA0032.outlook.office365.com
 (2603:10b6:408:ac::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Tue, 10 Dec 2019 14:43:45 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 199.43.4.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=199.43.4.28; helo=rmmaillnx1.cadence.com;
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT060.mail.protection.outlook.com (10.13.179.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 14:43:44 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xBAEhf9g021327
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Tue, 10 Dec 2019 09:43:42 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 06:43:39 -0800
Date: Tue, 10 Dec 2019 15:43:36 +0100
From: =?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH v4 6/6] i3c: master: dw: reattach device on first
 available location of address table
Message-ID: <20191210144336.GB31515@global.cadence.com>
References: <20191210101502.8401-1-pgaj@cadence.com>
 <20191210101502.8401-7-pgaj@cadence.com>
 <CH2PR12MB42165699E80C5063BE111BB7AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB42165699E80C5063BE111BB7AE5B0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(36092001)(199004)(189003)(4326008)(33656002)(81166006)(107886003)(81156014)(8676002)(6286002)(55016002)(76130400001)(2906002)(7696005)(6916009)(8936002)(16526019)(186003)(26005)(1076003)(5660300002)(70586007)(70206006)(478600001)(316002)(86362001)(54906003)(426003)(66574012)(26826003)(956004)(356004)(6666004)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6932; H:rmmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c967dd-0373-47b0-eae6-08d77d7f5b6b
X-MS-TrafficTypeDiagnostic: BN8PR07MB6932:
X-Microsoft-Antispam-PRVS: <BN8PR07MB693282DB954FCE1C2D950DCFC25B0@BN8PR07MB6932.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d+7Xl/TDVWQzzIvzbm9cR6idz8scX7fOAyGfSoLqu0Mm2ki4IRsDlGBAVrGJkVRxCqauxTZWb37mlcNv4QMwcqOIGvcmH6CuzUmNtFzWcN0a83V9NiTe9ADj7B7hBOVimAXmPfcBUdTkpz6w4ZPGPVGaK7JluQ901JYw0qXiVw4MEqPQganc5ChqUYYOJwgdVmb39Xeko8BMicwhdyoq8rwrmgi3LUTv6kP35QkqqvIgW+EdGdaLWnbG7KzzvAJC2wqojmKiVhW+/gBX09lMxUBig+3fkSp9bEIcXQUV5FPrVpqZaXgTZABfu8p4ccJ3Bz7zO1Y0lGsOvhh7Bpk426zF0JgypySBBU1wTpvjxXMfpm6HHalET3p/bX70CFxJSzKWruaR9nY35NkHKEnxmZLh4N9jyTUihkKFTJCKXocIEBBqvVHeaUXqR6lMqf33Ld9am3vVzp8mbTKZFQUYIuXKjcHSdlv+Yi2VTqCeSDWMfEQIFY2RMFfWEIg5BPdu
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 14:43:44.3631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c967dd-0373-47b0-eae6-08d77d7f5b6b
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6932
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_03:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxlogscore=999
 suspectscore=2 malwarescore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_064350_590997_5F1F3D63 
X-CRM114-Status: GOOD (  20.62  )
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
 Joao Pinto <Joao.Pinto@synopsys.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgVml0b3IsCgpUaGUgMTIvMTAvMjAxOSAxNDo0MCwgVml0b3IgU29hcmVzIHdyb3RlOgo+IAo+
ICsrSm/Do28gUGludG8KPiAKPiBIaSBQcnplbXlzxYJhdywKPiAKPiBTb3JyeSBmb3IgdGhpcywg
YnV0IHBsZWFzZSBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB0aGlzIHNlcmllcy4gQm9yaXMgYXMgCj4g
TWFpbnRhaW5lciBjb3VsZCBhbHJlYWR5IG1lcmdlIGl0IHdoZW4gZ2l2ZXMgcmIgdGFnLgoKT0ss
IHVuZGVyc3RhbmQuIFRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLgoKPiAKPiBGcm9tOiBQ
cnplbXlzxYJhdyBHYWogPHBnYWpAY2FkZW5jZS5jb20+Cj4gRGF0ZTogVHVlLCBEZWMgMTAsIDIw
MTkgYXQgMTA6MTU6MDIKPiAKPiA+IEZyb206IFZpdG9yIFNvYXJlcyA8dml0b3Iuc29hcmVzQHN5
bm9wc3lzLmNvbT4KPiA+IAo+ID4gRm9yIHRvZGF5IHRoZSByZWF0dGFjaCBmdW5jdGlvbiBvbmx5
IHVwZGF0ZSB0aGUgZGV2aWNlIGFkZHJlc3Mgb24gdGhlCj4gPiBjb250cm9sbGVyLgo+ID4gCj4g
PiBVcGRhdGUgdGhlIGxvY2F0aW9uIHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgdG9vLCB3aWxsIG9w
dGltaXplIHRoZQo+ID4gZW51bWVyYXRpb24gcHJvY2VzcyBhdm9pZGluZyBhZGRpdGlvbmFsIGNo
ZWNrcyB0byBrZWVwIHRoZSBhdmFpbGFibGUKPiA+IHBvc2l0aW9ucyBvbiBhZGRyZXNzIHRhYmxl
IGNvbnNlY3V0aXZlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaXRvciBTb2FyZXMgPHZpdG9y
LnNvYXJlc0BzeW5vcHN5cy5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxi
b3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFByemVteXNs
YXcgR2FqIDxwZ2FqQGNhZGVuY2UuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2UgaW4gdjM6Cj4gPiAg
IC0gTm9uZQo+ID4gCj4gPiBDaGFuZ2UgaW4gdjI6Cj4gPiAgIC0gQWRkIEJvcmlzIHJiLXRhZwo+
ID4gLS0tCj4gPiAgZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyB8IDE2ICsrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4gCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYyBiL2RyaXZl
cnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPiA+IGluZGV4IGIwZmYwZTEyZDg0Yy4uYzZj
YWJhMzlhMzRiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0
ZXIuYwo+ID4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+ID4gQEAg
LTg5OSw2ICs4OTksMjIgQEAgc3RhdGljIGludCBkd19pM2NfbWFzdGVyX3JlYXR0YWNoX2kzY19k
ZXYoc3RydWN0IGkzY19kZXZfZGVzYyAqZGV2LAo+ID4gIAlzdHJ1Y3QgZHdfaTNjX2kyY19kZXZf
ZGF0YSAqZGF0YSA9IGkzY19kZXZfZ2V0X21hc3Rlcl9kYXRhKGRldik7Cj4gPiAgCXN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm0gPSBpM2NfZGV2X2dldF9tYXN0ZXIoZGV2KTsKPiA+ICAJ
c3RydWN0IGR3X2kzY19tYXN0ZXIgKm1hc3RlciA9IHRvX2R3X2kzY19tYXN0ZXIobSk7Cj4gPiAr
CWludCBwb3M7Cj4gPiArCj4gPiArCXBvcyA9IGR3X2kzY19tYXN0ZXJfZ2V0X2ZyZWVfcG9zKG1h
c3Rlcik7Cj4gPiArCj4gPiArCWlmIChkYXRhLT5pbmRleCA+IHBvcyAmJiBwb3MgPiAwKSB7Cj4g
PiArCQl3cml0ZWwoMCwKPiA+ICsJCSAgICAgICBtYXN0ZXItPnJlZ3MgKwo+ID4gKwkJICAgICAg
IERFVl9BRERSX1RBQkxFX0xPQyhtYXN0ZXItPmRhdHN0YXJ0YWRkciwgZGF0YS0+aW5kZXgpKTsK
PiA+ICsKPiA+ICsJCW1hc3Rlci0+YWRkcnNbZGF0YS0+aW5kZXhdID0gMDsKPiA+ICsJCW1hc3Rl
ci0+ZnJlZV9wb3MgfD0gQklUKGRhdGEtPmluZGV4KTsKPiA+ICsKPiA+ICsJCWRhdGEtPmluZGV4
ID0gcG9zOwo+ID4gKwkJbWFzdGVyLT5hZGRyc1twb3NdID0gZGV2LT5pbmZvLmR5bl9hZGRyOwo+
ID4gKwkJbWFzdGVyLT5mcmVlX3BvcyAmPSB+QklUKHBvcyk7Cj4gPiArCX0KPiA+ICAKPiA+ICAJ
d3JpdGVsKERFVl9BRERSX1RBQkxFX0RZTkFNSUNfQUREUihkZXYtPmluZm8uZHluX2FkZHIpLAo+
ID4gIAkgICAgICAgbWFzdGVyLT5yZWdzICsKPiA+IC0tIAo+ID4gMi4xNC4wCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IFZpdG9yIFNvYXJlcwoKLS0gCi0tClJlZ2FyZHMsClByemVtZWsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
