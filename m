Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A29CC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 06:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56DC7206DC
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 06:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXqeOKPC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="gkHA4bBp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="swJOBiXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56DC7206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKqdfcyDHxdr20R3uxGn8BKAMjJzW9f7EetATu/ckg0=; b=OXqeOKPCQhMxkB
	8eeQn7dDCvi9Jfbx2jenLOPobr7J7kmiaMuwHngbEL+p+g4AYmh8jpN/gVC3VAbxtiDcDdOdKxoO9
	ezcMQvXK02LDyCPPyJCbKRZyAOno4iUdBrmOWOSQZp2j/FgQ6ftpRi63169G98awdK/GaPAYmSPqe
	zXTGYAzWcGQ0N0oDMQ28ggPs/AxAAhT1FXfVidr3KlUfJBNidNF0ef8CIlXRfZVM+dL2RuKe9Yogc
	JB6ownmN0PF+R9pAsumPN+F9HgTPA86oulLeQXhu+LYi3NELom216mzNcMcVWESHNMyICO7uc/rwp
	88ky6N+Bak8iA5lJYCkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV8O7-00072u-0h; Thu, 14 Nov 2019 06:13:51 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV8O3-00072Z-Kz
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 06:13:49 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAE6DZgD016422; Wed, 13 Nov 2019 22:13:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=XrTZTKiHRs+EjvgRP/gsTbcFJ20piZgpzeHZur/8umw=;
 b=gkHA4bBpD1FG2vA7Yt179uEo86ZScLYYnf47BLJqRyn6jokui3XtnISM5UqfOC/lYkGj
 mJHNlJTLxKt17ikfR+kRmDoxLvpyDW4eQ/YSItugRaQ8aC+yHJmAtbcvrA6SdZnQI/YJ
 GBj5eZ9XWagTj8STHLf4n8fkZqrMjBv6dFyFynb63SaIA77EIuVE6tF48I8YlmY3i8PJ
 6Bd9nZXialXoj1WdQqgSu/z4tGTXjRp8o0qyEEjT/v2QizSXBzOOETAdTmpKZToPXPys
 iudKddRS4W6nsqSE65ZZ+Mv2ngyp0528xoOmNR/Nl/cCp6AtSw0tzDBOItwEiP2CGGbT xg== 
Received: from nam03-co1-obe.outbound.protection.outlook.com
 (mail-co1nam03lp2051.outbound.protection.outlook.com [104.47.40.51])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w7pry9bem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Nov 2019 22:13:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNCkAbkOmZVP81m6IITBqJh17dj0PnGio9OC0kTGXRRgeTVaW5MyCL6uxi8EtEj83S3Dpo8SuLO8Z7Comu7ZWpfboK//40SbRvgIlyYp7vUdscdc38711oYQqPh0+/Tj5h5EX+pliOgx/9MoM/HTlYkb0TC1GV/+FBs8cigAg0HHGNslOx6JTvuBDbosE49dvnOUDWJKk4J4ESUYZKBQIzAK3SCscaIcoZYEdEetleJvFx8QN+mSpxujf86wcDSoU4RM+U15kcKhWpCliyGV0tvoVA2IdBIdgHcaWXvNEA/no6NZE7+/LKb9vRlSSopWVrcsK5l6UXN+MYQJciGPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrTZTKiHRs+EjvgRP/gsTbcFJ20piZgpzeHZur/8umw=;
 b=aVyMXnlc27Xwv5ChImQrEpIDTc1LdSzNL1vnpkek1UdEgW4fUIZfJkHUTZhYvjoE6AhU69ZnCcU7All8wrMXTwn7VOHItTqotA06PolAtegLzPao2ImKPzgozhSWq/ZquyuGb1Ddk/RuOPhz3cly1DZxFdWjYFgMeDHOFAz3LVF83SmRnuhQwKA3NjpN7LnTFoVfpqidid6VbslFOG0ln2oNmykJH7zmB5rgUZeZuWLondJAHu8oYSpnjA8xpx9CIjVuJ7KT4vSXSUYbwjqR3Q3anTQd9QebcTEUXTvCcOetYE89vWwDbcoxPg6+uC+H8I2Bxv71yrcj2+BFCTuhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrTZTKiHRs+EjvgRP/gsTbcFJ20piZgpzeHZur/8umw=;
 b=swJOBiXdqbUBflj0hlXbYxoOQ4Uccp/Pqt701+BgmQUDzUSbyuD0pfwbhX9oFjp1Cov4KUzx8UbA4HFhT35pAmKQZfimVTSkwmMel9wFwzzP9jneX65STVLXJ1eWmwcVuCX9TSFvO3Fw6mUUSguWmCOdwBq+7kBfYxGX6Znr0hE=
Received: from CH2PR07CA0023.namprd07.prod.outlook.com (2603:10b6:610:20::36)
 by DM5PR07MB3467.namprd07.prod.outlook.com (2603:10b6:4:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 14 Nov
 2019 06:10:18 +0000
Received: from DM3NAM05FT008.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::200) by CH2PR07CA0023.outlook.office365.com
 (2603:10b6:610:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 06:10:18 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT008.mail.protection.outlook.com (10.152.98.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.15 via Frontend Transport; Thu, 14 Nov 2019 06:10:17 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id xAE6AGju030426
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 13 Nov 2019 22:10:16 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 13 Nov 2019 22:10:15 -0800
Date: Thu, 14 Nov 2019 07:10:12 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191114061011.GA25288@global.cadence.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112084127.6efc6fac@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39850400004)(36092001)(199004)(189003)(2486003)(7636002)(86362001)(316002)(76130400001)(16526019)(6116002)(54906003)(55016002)(305945005)(186003)(66066001)(70586007)(58126008)(53416004)(14444005)(356004)(16586007)(23676004)(6246003)(70206006)(229853002)(478600001)(6666004)(50466002)(76176011)(6286002)(7116003)(7736002)(6916009)(246002)(446003)(8936002)(26826003)(1076003)(33656002)(5660300002)(476003)(11346002)(26005)(4326008)(126002)(47776003)(956004)(8676002)(336012)(7696005)(386003)(3846002)(426003)(486006)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3467; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97489bd4-9433-41ac-377d-08d768c9525a
X-MS-TrafficTypeDiagnostic: DM5PR07MB3467:
X-Microsoft-Antispam-PRVS: <DM5PR07MB34679DE30F45F9B94EEF8460C2710@DM5PR07MB3467.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NuGX1+UEEiUnwYMUMSpIFxlfv0MMOV8UaM/84sJu8c8AtoP3Pp/Lvdcs7rPXGdF9EG7c4mtjYaz6oOqG1dYJP4H8dfStB8KcSiGKghwoq7xsCCCGNlm46kaG783TEMwkMHVBp3IPpJRhEwJfKzJoqp/n4fIYg63Xums6KU4ukbKp6Czt5JHjpofQsL6sMQbQmMtcbHbhTWspTwwv3sXS7zh2G+aG0PGKWBf21mE3+ftNgIHs8Nmqx1tSqdPMc/gaPJxxOibRyGlP1HOpBxpmOhAE9p2EuvxgseGuVBGATeQ58zTrGCpMQcIReSLrQIZaxdubPtTSer/svRE1OZyKl+kLSZSwdfadZtGqvTAxRruOAt4Z7KgNmcEz6HWZm/UMheYqK4c6yF5SaMXGurCeaWALdVVPXWUi4q7BIsYTFmcj6FNaBL09DYqKjPNCRR0rtuw4Hj+yGn6YWMBPzbfYUg==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 06:10:17.4463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97489bd4-9433-41ac-377d-08d768c9525a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3467
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_01:2019-11-13,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911140059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_221347_821260_89EEB39F 
X-CRM114-Status: GOOD (  28.19  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

The 11/12/2019 08:41, Boris Brezillon wrote:
> 
> Hi Vitor,
> 
> On Mon, 11 Nov 2019 12:30:45 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi Boris and Przemek,
> > 
> > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > to address during the takeover of the bus.
> 
> Okay. Would you mind sharing a branch with this material so Przemek and
> I can have a look at it?

So, Vitor, can you share your changes? Can you tell me what you had to
change to make it work? Also, which patch version is this based on?

> 
> > 
> > I don't know if you are aware but the secondary master feature 
> > description was improved for the spec v1.1 and it makes sense to take a 
> > look on that.
> 
> Unfortunately I don't have access to non-public specs, but I guess
> Przemek has access to it. Any specific details you want to share
> regarding secondary master/mastership handover in v1.1?

Yes, that's it. Regarding secondary master features, the description is
improved, mostly clarified IMO.

> 
> > 
> > Regarding the current approach (at least last Patch series and what I 
> > did) I still don't know if it is the best solution.
> 
> That's exactly what we're trying to sort out :-).
> 
> > I remember in the beginning of secondary master support I discuss with 
> > Boris about USB OTG vs I2C slave mode and now having a better 
> > understanding how USB OTG works I think we should address secondary 
> > master in a similar way.
> 
> I don't remember mentioning OTG. I did mention the USB gadget model
> which I thought was a good approach for the I3C slave feature, but
> AFAICT, OTG is quite different from the I3C mastership handover
> mechanism. Master/slave selection in OTG is based on a pin (ID pin
> IIRC), and AFAIR the device can't change role dynamically (it has to be
> unplugged). Can you be more specific about what you think should be
> taken from the OTG approach?
> 
> > At least for me it seems to be more modular and 
> > ease to expand.
> 
> I keep thinking we won't be able to address both things at the same
> time. As I said many times, I3C slave support sounds orthogonal to the
> I3C mastership handover bits. I know the master acts as a 'slave' when
> it doesn't own the bus, but it's a rather specific slave profile (at
> least if the secondary master only implements the master profile) where
> only MR events can be sent/received. I don't think we should expose it
> as an I3C slave (or gadget if we make an analogy with the USB subsystem)
> in that case.
> 
> Can we please focus on I3C mastership handover here, and put I3C slave
> support on the side. BTW, if you have a draft for the I3C slave
> framework, don't hesitate to post it, that's something we can review in
> parallel.
> 
> Regards,
> 
> Boris

-- 
--
Regards,
Przemek

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
