Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3694C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 12:49:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75CB20709
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 12:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W1pE0rYk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="IupaI+bA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="6LLBacXS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75CB20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/G18GGllMIx2rpMva344oneFbRvAl+cJso/NwQIi2A=; b=W1pE0rYkw4C+Kc
	mE0Uc4N5tLS8ZyF91Jmihz5ci+QHjwb3FSpN2G51HFVJLjfBPRDIFTEcOFIeGx+4/7kdj04W/tZGU
	0bkf/nU1ZlMsZ60k/lOpAWv9NLwkN9s817ZnMZqz5AfqJ/9v6yvtmcIfrxaUF5oAn/chHuhRhj5np
	42fxFELbJjqtsUkAToWOSUKsWdUzmNlTcJISBsZ8/PZgAoskVw8jLQRASX1sl57VoPJ42LV4XmRGm
	QpWTl2y9LPc0fqvN3BKIzQKMNkZqpIwvzfHHKPr+FRM+U+Yn7ZCbfEZK8n2Yru3bYqj5IYWjFnWAX
	Dwr7TDPQsz/ULEbA/FAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVEYf-0008Nn-C8; Thu, 14 Nov 2019 12:49:09 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVEYc-0008NM-9K
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 12:49:07 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAECkaFj006172; Thu, 14 Nov 2019 04:49:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=9NNqJMMlIxeScBnK+ZNVQwEHuLmWTokacVJeWlICEM8=;
 b=IupaI+bAN66x5sYALp3DRIW0nOjbSkaLgQoYKDNePn5bcxx0Z8ezrnZqk0uOhEh6BLee
 eWF8z5ctMcVgie9oQiwg6e9TLj+Qx/1tkqrOhBqZWXYPjm15TDXjzu1SdAFZYhYOwfwL
 kMXf99sT9rWoZjL2upHmr7twHUW+jH1c1lDCU5IPbGI6ZD8SDRVfwo86mdYE3ipb4hN4
 fF6pX8ET7f3JipclBbKgTc4NzcdEXRy1P0fE2FZzeLC21lV4omqvjfPu2WQEl/W5zpko
 ijBg2zkb0je/Kr6PSxBkyGaleNNGT9PFixsVTq8vyESbVignhj3iW8CLcLKJ+Tgnba7s 9w== 
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2057.outbound.protection.outlook.com [104.47.49.57])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt294m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 04:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkidvBLtLAeYTXozRPD5eFnyWJxQNjGv/GGqFidezbS95T4nXBxC2OdLxRuSnPZmFFWg4G2O3Cv+2m0gMAyWo7JYZHsugAL1gOZEDuJfb2EatxZZIol6tUzmaX17Amljug6+6SwXkg5ZeTT/0JOFcub/rF1w2XKJKzpoBWyoN69Xoa+C5x8ygsMviNV7gYVLqyCnIk8CV/CS1HrNnwOMc/nfIb7bh4vn1Lhmano0XL+NGf4FaLNXMZERhlj2JCLASHyw/MbaqpfSoPPlfLYtkl6QZRtgI8ZQjRXGiRW4Gd8L0E4gtr1eJCmenUo5R92CMKUb7AHbztK5MkRFAqzNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NNqJMMlIxeScBnK+ZNVQwEHuLmWTokacVJeWlICEM8=;
 b=W2YQsRU2j6aNL10eO/l9eOjl7foltcg8W9nUQy0/qonwpdocvT0oECH8kCujsuuq0Rftj6/gaxYLA20MtTIbsD6BE/JHnTwziC4w0F69yhlAlNc3WLxKQP2Yqw4lTlC53Ys/bWe93vWZTyU3B8QmJlu67u9mQ6uQfQYqqADW1sQ2DJwFVvMof3o99UVGPEG2hSdzMCZP6w4pBHnqkMk6Gi72/CSkIY25XcHX1aXRhrzRXcfFhWj+pWbTrFiNV6mrzf1iMouH4/bIUZMuOjUSVccctXPK/k5Shh264p8bEyNJsqPSXkqaD/YqPNX4MHCIGxcj6/ZZ8DfyjJya59dWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=kernel.org smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NNqJMMlIxeScBnK+ZNVQwEHuLmWTokacVJeWlICEM8=;
 b=6LLBacXSd3xaIiiFr0qeGQrxahrrALQYZT/bosWHkF5aqjTyQejLFj+igbjQcJj0gmucPO4B4WOpTq24VDO2uEB0qhro3JTD7Wtsdu38Zr+RN0BYwC/9HUgi+fKaw5lWNzH2rxWoBOjYjVR3aTQO1TLeOeax9wwSyZzaU+48Frk=
Received: from DM6PR07CA0053.namprd07.prod.outlook.com (2603:10b6:5:74::30) by
 SN4PR0701MB3808.namprd07.prod.outlook.com (2603:10b6:803:46::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 14 Nov
 2019 12:49:01 +0000
Received: from CO1NAM05FT049.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::203) by DM6PR07CA0053.outlook.office365.com
 (2603:10b6:5:74::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 12:49:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT049.mail.protection.outlook.com (10.152.96.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8 via Frontend Transport; Thu, 14 Nov 2019 12:49:01 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAECn0xs021112
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 04:49:00 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 04:48:59 -0800
Date: Thu, 14 Nov 2019 13:48:56 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 0/3] Add data hold delay support
Message-ID: <20191114124855.GA13588@global.cadence.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <CH2PR12MB4216AF4224EDEE99E6C4B74FAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216AF4224EDEE99E6C4B74FAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(36092001)(6916009)(2486003)(23676004)(11346002)(7696005)(2906002)(8676002)(26826003)(53416004)(6666004)(126002)(426003)(33656002)(478600001)(50466002)(386003)(8936002)(14444005)(446003)(246002)(76176011)(956004)(5660300002)(486006)(70206006)(476003)(55016002)(186003)(70586007)(16526019)(76130400001)(1076003)(336012)(16586007)(316002)(58126008)(6286002)(54906003)(356004)(305945005)(6246003)(66066001)(6116002)(229853002)(86362001)(7736002)(4326008)(3846002)(107886003)(7636002)(47776003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0701MB3808; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a8dde8b-c0d9-49da-0c50-08d7690105f4
X-MS-TrafficTypeDiagnostic: SN4PR0701MB3808:
X-Microsoft-Antispam-PRVS: <SN4PR0701MB3808B0419ED58EEE59C02E9DC2710@SN4PR0701MB3808.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9qft3cGkMx/9neXcUMKaCrqepaekpQYEdCEJVDrwG+KglgY22lwSOybMmH8dOr6oZKp4Y7eS8BjaE45xxphsblrP9d8yrnJ3nfkvIsLjtp/cJQGUo8tLG8jxh156BKWNaMW3uOhhHTsL1D6oQUSO8XvGhyAWQXX7KtfZ2stt0+A/LWFHTJLjJNxP1sEQvJmrRV5o+mBIbEG3cM+6VFV1+6OpE7Yu7jlfGy9LbGekOIqhVwWYKJG3pVv5WEifyDtgoycgvMh2bm0AOymkXQk28nwsNMk2ppm9Ga3DGe/ycVPc8jSVvt3zNo6bnspPUNty0dYLHnBwg6NxZw4tRaWKUJ2fZwARLI90DTWQDEUhqcb1wN0h0gQZxrIdxznrGbxrlOfh+wUSRnKhXRnUc3tAKeA0XlA1vK2LyMnMqURs+L7Sh1931/syO+G4Q/lqbBIP2Bt46u7EaGCmjdgYJxFIjw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 12:49:01.1217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8dde8b-c0d9-49da-0c50-08d7690105f4
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3808
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_03:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_044906_394975_86F8150F 
X-CRM114-Status: GOOD (  14.55  )
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
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

The 11/14/2019 11:58, Vitor Soares wrote:
> 
> Hi,
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Thu, Nov 14, 2019 at 05:51:52
> 
> > Add THD_DEL (Data Hold Delay) support. After testing different scenarios,
> > on various systems, sometimes there is a need to delay SDA_OUT propagation.
> > 
> > Adding support which allows to configure that delay using the device
> > tree parameter.
> > 
> > Przemyslaw Gaj (3):
> >   i3c: master: add data hold delay support
> >   dt-bindings: i3c: Document data hold delay feature
> >   MAINTAINERS: add myself as maintainer of Cadence I3C master controller
> >     driver
> > 
> >  Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt | 6 ++++++
> >  MAINTAINERS                                               | 6 ++++++
> >  drivers/i3c/master/i3c-master-cdns.c                      | 5 ++++-
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > -- 
> > 2.14.0
> 
> I'm trying to understand this implementation and the use case but I'm not 
> understanding.
> 
> Could you please elaborate?

There is new controller functionality which allows to meet SDA to SCL
propagation time. Baisically, you can delay SDA propagation using this
functionality to meet I3C MIPI spec timing. This is very useful for some
SoC designs.

From Spec:
Table 75 of MIPI I3C Specification 1.0 (page 142) defines non-zero
minimal tHD_PP timing on master output (Fig 65). This setting allows to
meet this timing on master's soc outputs, regardless of PCB balancing.

> 
> Best regards,
> Vitor Soares

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
