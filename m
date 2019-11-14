Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EFFC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B0920709
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dNpDm/na";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="QGZ3d5x5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="E10fhP4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B0920709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTTXpEvPU6ZGucAUxxc+DoFbsjhQiTT79DVQc4jKyHs=; b=dNpDm/namWIgod
	xn6DNEgDlv+ydkP10Rx5DJ6U1d4THf6lKkde7WihbDp+sKh9ADN/bcBZpjbWyqPo1VeiIe75G9IvV
	w6bz7aNYd6G9jkZAn/j8SCIkRbnXwOv0t/oPnjDxB0DMJ0m9BtHd9hLcf5VfNBKYswzkSjwsm1mdh
	WITTN+2pbc2DDm+ECVMMoNUPoUpFlOKhNamD9N5SDD50RXNzpIMLk/CAr/SbhA7B2eNsbb//edTmN
	uOEfOoMYSn/Vc4GOS2PeZbsTFLBLIQ1EMukXPhMGRhf/8nvQPWMLjNNEL4Z/IhHQwrUZoNPs/G/Ie
	Bbv1OjYJBDSUN9M+9PvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVEjJ-0006EY-L1; Thu, 14 Nov 2019 13:00:09 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVEjH-0005qz-5t
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 13:00:08 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAECqMpH011121; Thu, 14 Nov 2019 05:00:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=/568DR8TY+jJInzvGAu8Di0ArQBqXmafMBW+3zelgJw=;
 b=QGZ3d5x5AXaqz38403owUSQeGpv0P8eAw3KrcFz3D+plwVHX8JgNt2G8MltThG2w200Q
 75UHa48ZmcHXiXf30XHOWHga9gaLv6E7S7Y9k7beSWb+Jw+o6laUJ86aqEjJa0cr+V+W
 30M89McFCgRLx8KQu9uKpeRCnUNH+iVQKbPJRiuqKKRir4iCGv6PmCLGnt59w1NbvWBv
 hAiq8MSnpZFMOPshOIvw1TmStYqCOZfh8mJwZLqhdnH+t1WUQDTs+HGVOSDG693nWEDK
 bbP9/GADWgK8mTmAx7waNV+tAIYa35AqnLWi0bklD4YIaeMb7HzfVCMH3NrhM6b0mv71 JA== 
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2056.outbound.protection.outlook.com [104.47.32.56])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w7prt2a5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2019 05:00:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmdfeYtx6Ka48bzh6r8T2uSfZglnb3VIdPc+AeAtu8PgmvhVb6sEZV18yACrDsB6F5BrXl7eiatxZTOLBHyCVE8lWCtZFzph9EPBX/PgiuS1Xz+zcimzcEAuioSzYJ1AjPUoWnRnWHAAnsXpo8JY9a0LPwS33sYpSRzPxz7kIAi8yYdiw4qe4mZP3UCHW/PjvhiX8nFVkWWOmKQOKvF1dlh1aQhskBTnI+8Rvqly/Wzjm/NOh8TE+RCU/LfkPqKUJWDxYvb0Cu1nFLsRs6IVAbJ7O51BzCfNZ+9bY5BdTvZrxn33KWo6CK8Jh7tLQLpRV2RTZzGkp02+onj1nAZkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/568DR8TY+jJInzvGAu8Di0ArQBqXmafMBW+3zelgJw=;
 b=cE6Y9pljUKfpuKkcbG67Opo7khxnzvnUWUel2AwwWizIRTqDAmUYW6Z4yUbZ6uOedtMjS5U9qipR4jAGJnZrPmxjCTyLwM0r6oe3YZImw3nzEwMU9Ga92IG/BfO5E4SYoh0mPURLwOggn4Ym+XL0aQK/6iNyLm0pmkkvwWuh/euBKD5kXN0yqVsv82bvEi+xgjiTw4h8dvLzwbGx4qdkqLxtc0NEx+U8iaLlpNI0fdTPpT3sEyEAW7EbYa3suzmaiOeMtNKQjFksZL8onApWTcuK7tl4s1UcN6WATFO8P7qcnKSyO9NyesTx7S4Rp+U+KHEnbSpfqPEAdl9Sv7FXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/568DR8TY+jJInzvGAu8Di0ArQBqXmafMBW+3zelgJw=;
 b=E10fhP4wDaVG0YRpAIed+u/+q7ODZdgb6PR6WmQ1v14kcPi0tus58+s3NLyTkxMQWcbS/ZXG7c9o3NrSfBZDunqUlsGtJ9AbdcSWkv0F5cLNXoUuClitX1RqKc7vCcGxlOSMcagZNvbEhNCtH+c/UHgTRTRHcthb5430aqa3td4=
Received: from BYAPR07CA0065.namprd07.prod.outlook.com (2603:10b6:a03:60::42)
 by BN8PR07MB6929.namprd07.prod.outlook.com (2603:10b6:408:7c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.24; Thu, 14 Nov
 2019 13:00:01 +0000
Received: from DM3NAM05FT040.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::207) by BYAPR07CA0065.outlook.office365.com
 (2603:10b6:a03:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 13:00:01 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM3NAM05FT040.mail.protection.outlook.com (10.152.98.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.8 via Frontend Transport; Thu, 14 Nov 2019 13:00:00 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAECxuam016386
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Nov 2019 07:59:57 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Nov 2019 04:59:54 -0800
Date: Thu, 14 Nov 2019 13:59:51 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191114125950.GB13588@global.cadence.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114133214.0b6ecc0a@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(199004)(189003)(36092001)(356004)(6666004)(8676002)(81166006)(26005)(126002)(26826003)(486006)(33656002)(386003)(316002)(4326008)(81156014)(58126008)(16586007)(478600001)(23676004)(53416004)(54906003)(1076003)(8936002)(2486003)(50466002)(76176011)(7696005)(55016002)(70206006)(7116003)(7736002)(305945005)(70586007)(6916009)(186003)(66066001)(16526019)(5660300002)(6246003)(3846002)(229853002)(956004)(107886003)(47776003)(426003)(476003)(6116002)(86362001)(6286002)(336012)(76130400001)(446003)(11346002)(2906002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR07MB6929; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca35cf1a-a644-4e71-4d22-08d769028eec
X-MS-TrafficTypeDiagnostic: BN8PR07MB6929:
X-Microsoft-Antispam-PRVS: <BN8PR07MB692932C01B6FFA178A480C14C2710@BN8PR07MB6929.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 02213C82F8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myOzbYwSpIQjw8FcLF4ysGQt2LEqz92xuftZn2QOz6IhigRBIuktIldXK24FLRfGWZgO1r/Ootvkx6YIoeH4OqfTHqQu86fxUGZOJIMeRqErIVFEkeLLBrkhbjJYYO01bPmbqiocUgjeNK+tGOf/cfXABnhzj2sdSDzh5vKBLbwoQsHqkCVu4ZYGe08FBfpP7wymkcANP9iTlQtyiJFcojKOVPw3xlD+gpXTtxKw+ykJNRIGp5IXLUFVfc5mmyKeeQ1kMug4IVHH9ElTpvYiOWkkjhNpZxnwzxKTFcuL3SIgcqA5ofVvOrCZOqcMQEb9C0MTG88yamDEoBJXoGJtd1L/bUx366YGxEI6FYulee0a8Qkyd6mSB4aPFlIvD2m+9o9xqpVQFhX5zTvL9/zYpxV6sXsu/SJ2pf1v4LybA4ffewlTOBQhbMbm1wL3c3SjGFNscufkfu2vpUzoYKxQSQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 13:00:00.4215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca35cf1a-a644-4e71-4d22-08d769028eec
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB6929
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-14_03:2019-11-14,2019-11-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911140121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_050007_239461_8422CA02 
X-CRM114-Status: GOOD (  25.47  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, rafalc@cadence.com,
 Vitor Soares <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi,

+Rafal

The 11/14/2019 13:32, Boris Brezillon wrote:
> 
> Hi Vitor,
> 
> On Thu, 14 Nov 2019 11:56:00 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi,
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Thu, Nov 14, 2019 at 06:10:12
> > 
> > > Hi Vitor,
> > > 
> > > The 11/12/2019 08:41, Boris Brezillon wrote:  
> > > > 
> > > > Hi Vitor,
> > > > 
> > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >   
> > > > > Hi Boris and Przemek,
> > > > > 
> > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > to address during the takeover of the bus.  
> > > > 
> > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > I can have a look at it?  
> > > 
> > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > change to make it work? Also, which patch version is this based on?  
> > 
> > I'm closing a task and after that I will prepare the RFC.
> 
> Okay, can we have an estimate? Are we talking about days or weeks?
> 
> > 
> > I based in all version and tried to pass everything to master.c file.
> 
> I'm not sure what that means, but okay.
> 
> > Right now my challenge it to trigger mastership request when a device 
> > driver want to access to the bus but I believe we can discuss that after.
> 
> That's kind of a basic feature when talking about mastership handover,
> but sure, we can discuss it after your RFC has been posted.
> 
> Note that I'm not super happy to have to go back to square 1 and throw
> away all of the work done by Przemek, especially since Przemek was the
> first one to post a patchset and he never really said he didn't
> want or didn't have time to continue working on this task (not even
> mentioning the time I spent reviewing those patches...).
> 
> If Przemek is fine with this situation I'm okay making an exception,
> but be aware that it's not how we usually do: the person that posts a
> patchset first leads the thing (of course, it's even better if there's
> some kind of coordination before the patch is posted).

It depends when you are able to post it. If it's this or next week,
I'm ok. But otherwise, I have to start working on that now. I'm trying
to address your comments from my latest patch, having in mind HCI
implementation. As I said before, our customer is pushing. They have
boards with our hardware and they started using that. Please let me
know.

> 
> BTW, you mentioned working on a lot of different topics, but most of
> them were left unfinished (userspace i3cdev interface, I3C slave
> framework/API, ...). Any plans to post RFCs on those aspects anytime
> soon? I mean, there's plenty of topics to work on, and I'd really prefer
> that each developer work on a different topic instead of duplicating the
> effort...
> 
> Regards,
> 
> Boris

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
