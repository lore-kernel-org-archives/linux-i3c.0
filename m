Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FE2C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 20:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E211220725
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 20:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCJNEIsK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Ay7SyJpn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="18bPIBWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E211220725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DZr6Rjntq+RW/VP8imWFDoFt7fsJ7Uh4P9Z2FsdYKs=; b=gCJNEIsKZmbp6H
	tPwY92S/QGvvDM3+bPvwSBmoogCt5h5dP5OsQEDcyNP1Xhrsg9aMvmXmIoarD6dxL44+LrATqOI2V
	WOedLWzy5e8l5LLmCsOImuFIov8n29z/ij/0zt5WMyh7FcTW4bIS2JufwzvjGpVAz7msq8lHsSnjF
	agt2612/5TBBs2tNilTyVcDPCBJPOAYvV80CTQ+vg2DpxhSh2tz+ZwbiPWZUvVZzfRawJzNQmg2XF
	6t4zkLom8Q9P7vTxegjCh/UtIJcaj2SbBdaqVgQ/iG3pea4hC2eUHpg6HcwS/i0dgMZ9ChZKJ/zWV
	Mkbg8lpT2+30rnsnUDew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVLWc-0003s8-K1; Thu, 14 Nov 2019 20:15:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVLWY-0003rg-Ub
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 20:15:29 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAEKDkmM023936; Thu, 14 Nov 2019 12:15:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=nARkqrRBIjxNb2mgzs7kMDKy8s+Llvtp+Oh2vc9U8ow=;
 b=Ay7SyJpnKtFdV4bCcrlwMV92WhlxZBtYgpmf/NXEVNiRQhs4Irx1yqBMm/qoq0a3W+5j
 kP4gKNqrjA878ox9wCKaXQGOlFRSFzOmkyje1idp64QMITNYF3S+llDYleDLlPW8UKQq
 fYT4YsGBo/YVAEWNuLo8O5qWb+pu0OGfTRpj3r8wC8WY2xQNCQgJB3lo1GZTx6F35Imb
 V6ZrwtohIBUXCqpI+ncwD5spVwOmHkOOq95B3vnHYEG2VirX6F7np2cpmCA8E96zJzQC
 RGf4EbMJRn6QMsJ7guUkAAxvg7CvkXAoT4ZQFukH3aLR3en3W16qM6fGz8jKzmp5ogRu UQ== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2052.outbound.protection.outlook.com [104.47.41.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2w7pryc7wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 12:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glWpHtonKYLQtpDuh4UmdiabGEuh964akkCXVGVajecPQONATqv98PmaD7wb1GJvbonESsDn5Bs+k3e0TGkN5nEG1zd7mpO5F8F609N98ZkxHYFQXV6lOZSIkA96K8Sippn0qh0TeH+hJqaarPPYjqos3AyV5GdYkSKBG9omyPMsZNrMngbuEAhOaFkUhvDAWvFtKU/tk0/zQYyYWGQ1pmu69qv7LFVulDYB9P9qzCghyUysGBGO7PkrTnKvd9Yh8867YQONE0UjqTiMr5DvqKpGWZmn1sZQWw/gjwzOw6TdzP5hrvxI0HBzbmjDdwhtHEHPjeDlbNKC9CDTWLIxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nARkqrRBIjxNb2mgzs7kMDKy8s+Llvtp+Oh2vc9U8ow=;
 b=Ko9/3q+5ZaqYnUq7Oneruyzhqs48wJsoyC/7HMHnKRfmzZi1EvAnr3k/ToY+hYo3bPNi65lNfaTgiIuUJBY43KEBNXcdIQsoeH7yh8qLIgHM8rIWzTPIxsJo8i3Riusc1dBY7TenFchkPcNh62EME3BjHNorDw2oC8viLt7BHgweXMu1Ntcfkw891vX6KJzL2hvOkDWmdqmnR+rvCg6/D18lDT5fRZUoxhsx0mrc7HdciZmpOl2ZzIA2y5hjdMdvOZt5rMCIuUDl2SFl7tFeSz6Hsw8ubBjuY69Kt6KoN7ZryosZOivrotSKpr8VXeT8/GcO7VovGxxE4U4W3TdbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nARkqrRBIjxNb2mgzs7kMDKy8s+Llvtp+Oh2vc9U8ow=;
 b=18bPIBWI7pah1ToC+AsOzV5pBKPwHmVjEovaQ4y9BXmFQbJRa1TyC24dajH5kSdQrZfHwWLuasjt2iLH/Emoenb9nn5UwB/xHR2Q0FZnrkOvr0TIXvP6xHUwfQJ2vygPV6E5zSTv33YTA5I7QiGqltbRQGCM5Q9oss377Xge/ZY=
Received: from BYAPR07CA0022.namprd07.prod.outlook.com (2603:10b6:a02:bc::35)
 by DM6PR07MB4540.namprd07.prod.outlook.com (2603:10b6:5:c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Thu, 14 Nov
 2019 20:15:17 +0000
Received: from DM6NAM12FT030.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::200) by BYAPR07CA0022.outlook.office365.com
 (2603:10b6:a02:bc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 20:15:17 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 DM6NAM12FT030.mail.protection.outlook.com (10.13.178.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 20:15:16 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAEKFFgK001558
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 12:15:15 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 12:15:14 -0800
Date: Thu, 14 Nov 2019 21:15:11 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191114201510.GA5537@global.cadence.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114155008.6551459c@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114155008.6551459c@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(189003)(199004)(36092001)(2906002)(5660300002)(26826003)(6916009)(6246003)(58126008)(76176011)(316002)(76130400001)(55016002)(6286002)(305945005)(7116003)(14444005)(3846002)(66066001)(47776003)(7636002)(478600001)(561944003)(33656002)(6116002)(7736002)(11346002)(446003)(476003)(486006)(50466002)(16526019)(336012)(26005)(186003)(246002)(386003)(126002)(54906003)(23676004)(16586007)(956004)(7696005)(6666004)(356004)(2486003)(86362001)(8936002)(53416004)(8676002)(70206006)(229853002)(70586007)(4326008)(426003)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4540; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a7eb1e0-d608-4678-358f-08d7693f5d9a
X-MS-TrafficTypeDiagnostic: DM6PR07MB4540:
X-Microsoft-Antispam-PRVS: <DM6PR07MB4540F8D7F63EEF4F1F2FA9BBC2710@DM6PR07MB4540.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDhy8l9YggTCm5+spo572flduTFYfL/p5SO77q4U1Djev/sgYfrd/uujNqJpifAWOXSPmozLUC/sFWD07qAWXV7zjEkKvCvLW9DKAFeMDFKt/AYL4IOPwBtYB7TVDy+1uLPLB019m+v49/XBiW8BZMWvnTxZvdaYgYu7VwuqdjGy6voI6ePoygueBJYRvd+yzfuE5uabdj+RJbo6zJWorPkVzQjNPCdHh5FBGN5PrV0CO2WI82ogcQ6V4NC4edt9+dZQYNL0jVfTd/qP7MlHvCBvF8G46RNqo+HhC1i6Jc/nzdYQBsXi+4MmAmKigANKQ7hF0fAEV3oGHpYxkRMlaA3Fhny/SUjviBsFCBbKFP58VzXY7xLf5gOWbkDDNHUD56DyX9GJp0ZxkWQXZVTMakQQ4FAkNqsp0HGcgP7yjgiCseYiO9Q4ZPZlz8LCJcuxzDXvWkpJANy41JiVbLr27A==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 20:15:16.9407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7eb1e0-d608-4678-358f-08d7693f5d9a
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4540
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_05:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911140166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_121527_376800_1CB92408 
X-CRM114-Status: GOOD (  34.16  )
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

The 11/14/2019 15:50, Boris Brezillon wrote:
> 
> On Thu, 14 Nov 2019 14:17:38 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Nov 14, 2019 at 12:32:14
> > 
> > > Hi Vitor,
> > > 
> > > On Thu, 14 Nov 2019 11:56:00 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >   
> > > > Hi,
> > > > 
> > > > From: Przemyslaw Gaj <pgaj@cadence.com>
> > > > Date: Thu, Nov 14, 2019 at 06:10:12
> > > >   
> > > > > Hi Vitor,
> > > > > 
> > > > > The 11/12/2019 08:41, Boris Brezillon wrote:    
> > > > > > 
> > > > > > Hi Vitor,
> > > > > > 
> > > > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > > >     
> > > > > > > Hi Boris and Przemek,
> > > > > > > 
> > > > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > > > to address during the takeover of the bus.    
> > > > > > 
> > > > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > > > I can have a look at it?    
> > > > > 
> > > > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > > > change to make it work? Also, which patch version is this based on?    
> > > > 
> > > > I'm closing a task and after that I will prepare the RFC.  
> > > 
> > > Okay, can we have an estimate? Are we talking about days or weeks?  
> > 
> > I will prioritize it for next week.
> 
> Great!
> 
> > 
> > >   
> > > > 
> > > > I based in all version and tried to pass everything to master.c file.  
> > > 
> > > I'm not sure what that means, but okay.
> > >   
> > > > Right now my challenge it to trigger mastership request when a device 
> > > > driver want to access to the bus but I believe we can discuss that after.  
> > > 
> > > That's kind of a basic feature when talking about mastership handover,
> > > but sure, we can discuss it after your RFC has been posted.  
> > 
> > I need to test if the time that device.c request the mastership and the 
> > controller has effectively the ownership of the bus is short enough to 
> > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > housekeeping of bus takeover.
> 
> We sorted that out in Przemek series already. Please base your work on
> what Przemek did (or at least look at it carefully), otherwise we're
> going to re-do/re-review the same things we did a few months back.
> 

Yes, that's how my patch series works. When device wants to transfer
data, mastership is requested automatically.

> > 
> > > 
> > > Note that I'm not super happy to have to go back to square 1 and throw
> > > away all of the work done by Przemek, especially since Przemek was the
> > > first one to post a patchset and he never really said he didn't
> > > want or didn't have time to continue working on this task (not even
> > > mentioning the time I spent reviewing those patches...).
> > > 
> > > If Przemek is fine with this situation I'm okay making an exception,
> > > but be aware that it's not how we usually do: the person that posts a
> > > patchset first leads the thing (of course, it's even better if there's
> > > some kind of coordination before the patch is posted).  
> > 
> > Honestly it looks like I'm competing on this which is not the case.
> > I just pointed out my concerns about this adoption because I see several 
> > issues on it.
> 
> Couldn't these problems/limitations be addressed in the existing
> implementation instead of re-implementing everything?
> 
> > The point is, at the end you can pick some parts of my sec 
> > master code and integrate in your solution.
> 
> I wish you had tried to modify what Przemek started instead of starting
> from scratch... Now someone will have to do the integration, but let's
> move on. Please post an RFC (or a public branch) as soon as possible,
> even if it's incomplete. It can even be something that doesn't compile.
> The idea being to check what's missing/wrong in Przemek implementation
> and see how we can merge the two.
> 
> > 
> > As I said previous for I3C spec 1.1 secondary master received a big 
> > improvement due the misunderstanding published in 1.0 spec.
> 
> Okay, I can't tell. Version 1.0 was already pretty clear to me with
> regard to mastership handover.
> 
> > I don't know 
> > any other protocol that implement such kind of feature and for this is 
> > from far the most complex feature to implement in SO based systems from 
> > i3c spec.
> 
> That's where the fun is, isn't it? :P
> 
> > 
> > > 
> > > BTW, you mentioned working on a lot of different topics, but most of
> > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > framework/API, ...).  
> > 
> > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > only expose i3c device without device driver yet I'm not happy with 
> > transfer struct.
> > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > need of a tool for ccc (but for testing purposes it would help a lot).
> 
> What about the I3C slave controller API/framework? Would be interesting
> to have someone work on that topic, and you seemed to be worried about
> how it would interact with masters that expose a real slave profile, so
> looking at it would be a good starting point IMHO.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
