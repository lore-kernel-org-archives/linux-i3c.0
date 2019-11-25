Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEDEC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 08:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F23C20815
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 08:04:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxCnnLgu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="bu1retDl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="7bL77/Dl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F23C20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi8YBWSUEj8ewGPy69Xxs1rp511Mjnn0ScSOAY+1eCU=; b=hxCnnLgujpQpgC
	8mvSRmOckDMi530xDSW7QIL9ocE8lSM7Whsl1vopKvSBvT+sxV29MtVjgcP7HFG912Sd+aRhdfP/Y
	PTCHrhZSANYKlMZb8s+JxT30uAR4m29jduVxhskXGmzq+Dp+u0YeCud/0YtzRkBJTxlMgZyVmknn9
	YGt7wzSwN06sJdnp91Srk2VCqVO4AuBhxdGkb6WyLiCatn8nS+UYOTKTSzEshRuaSfLQYP+27Gl5S
	huLt89gSDlXJ0dRDS7jGkF6+hEWyjrOL+2BqAmy+E/hAo56ISMHUsecNrW3/Bh54N+CO2zEPF7k4U
	XIsp7bN9Nk8zFK0P5p8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ9M7-0004nb-1P; Mon, 25 Nov 2019 08:04:23 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ9M3-0004n8-51
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 08:04:21 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP83u51016614; Mon, 25 Nov 2019 00:04:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=34cPOlBgSD0RHKIIfoWQHeRKuW68z8nbeLwE0OWJ54I=;
 b=bu1retDlHhgXG6VFsDmFnbjgNY9JdVHi6hrv6fKRFTlvjdr+gHYwVda4smKC0Csd9Nw5
 L66qIiWdKn6VmM3u8CrrJ1bHCv2qzG5pw50WaMC3r60MWGh5FQbOAjmsCqOycCuYsuB9
 2+jAdF8Am22PUzE6S4Up8PiCTp6VrhTY+e1zTHqAMukQVXGdIbuKlFowazjthkF98vVL
 aw23Act+PNAMW+mf0EMfctT3Bo2QOMdTETNrbPODVHOR6vPkASr6qvRkdRp5/ByL3DOx
 FPk70VKQb08YWW+4Sfe3ir77jx652+Qr5FQVHpwW0Fug1kFHa+xhgRDI+bvhWMD4l6EJ 8Q== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2050.outbound.protection.outlook.com [104.47.36.50])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wf18068w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 00:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ0JUpunZlED2LGULk6mluASd1XwJx2AyfXwst40fEh6Y85JWKNEoteX0xBhcnYOdCyf4fqOHTaKTM6sdb1/fHJWCxdFKLut+V8xMvigL7mx6Z6W4ZY0Vp1q4ihgaEvC33Y4MyCuclD6bNBn63jV4MFkPythmzzKumgBDRwuZLJ7qto/lCOVQxCsPUxgVQ1yacj2favaDZ916FuAme1yWeurLJbN43EIy0bPnZ7ftvj8+t/A8v4qvPzAAuiVgJAhoNngoSljhjYlEF+xufSwIDB82RGxYTM+VR6MDlrqjAQoIylrVm/pU0Rb0dElE6/VZtzWXg6FUwRLWtnUz52Vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34cPOlBgSD0RHKIIfoWQHeRKuW68z8nbeLwE0OWJ54I=;
 b=oMUMcSU2XZEAIh7prxDe3t2xh80ixmHr6AR1crPuv5PU32V00X0SNlMB62+LMcP/d2kyQiEVcyp1lt/koTyMmDADk5pVzvX9i39C/JIAzQflGHZyfpDSKmzOfV1ppLMCMJA1otlBj6NDlS6pbk3852lM3A2BMcYnuJ8kBiDYiCOVRxKlQ0oYuGnlUPf934REz2rRL/+knEz4mLcRyxS1RtxgxISAYqEWBDYomm+xwgw6QDlAAvYhTDrSYfjyp+DDhpkoZdcaQBu+E8X/6h/1oj16VIJw7ursIuUiTkBYLHiHZsz04u8/34jFSLvlHroqZULwjB/mhyodrBVlVUoaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=collabora.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34cPOlBgSD0RHKIIfoWQHeRKuW68z8nbeLwE0OWJ54I=;
 b=7bL77/Dl5HJZE8gx/OZHudFJLzNHpmKWYhkZDYin2n2mysTzOFL8ipXopnln++ABtL7vex0m31jnmgdLXC2H79Bve1GjXfrAnDuKt+th3YPh46pt+FUrVQeWPNQj3UFFrPNyvNeT9e2RNTwlVXy2xPjO+ST2GNQHqbo4f5BLgp8=
Received: from BYAPR07CA0049.namprd07.prod.outlook.com (2603:10b6:a03:60::26)
 by SN6PR07MB4783.namprd07.prod.outlook.com (2603:10b6:805:3c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Mon, 25 Nov
 2019 08:03:42 +0000
Received: from MW2NAM12FT040.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::205) by BYAPR07CA0049.outlook.office365.com
 (2603:10b6:a03:60::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Mon, 25 Nov 2019 08:02:37 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 MW2NAM12FT040.mail.protection.outlook.com (10.13.180.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18 via Frontend Transport; Mon, 25 Nov 2019 08:02:37 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAP82TtS018480
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 25 Nov 2019 03:02:35 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 00:02:30 -0800
Date: Mon, 25 Nov 2019 09:02:22 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125080220.GA30630@global.cadence.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(199004)(189003)(36092001)(229853002)(53416004)(26826003)(356004)(6666004)(76176011)(7696005)(2906002)(4326008)(1076003)(23676004)(26005)(54906003)(5660300002)(58126008)(386003)(16586007)(2486003)(70206006)(336012)(70586007)(426003)(561944003)(3846002)(6116002)(33656002)(76130400001)(186003)(14444005)(6246003)(55016002)(16526019)(956004)(11346002)(50466002)(8676002)(8936002)(7116003)(66066001)(81166006)(81156014)(47776003)(6916009)(86362001)(498600001)(305945005)(7736002)(446003)(6286002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4783; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace1e7d3-834a-407b-593e-08d7717dd61e
X-MS-TrafficTypeDiagnostic: SN6PR07MB4783:
X-Microsoft-Antispam-PRVS: <SN6PR07MB4783AC8740EA6CAAEFC96716C24A0@SN6PR07MB4783.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1iCrzUtZv0yUoAtKp8J8ciWhd6Clsx3jQSeXLQly663F/NB0Y5YEXQ+WLN/PjyQa28EO48uEyh/KPC96JvUxRAG8FGpaPU/gylLSi/slW6nowLyfsTo1arGZCtSFBs4qJleMXHCjaeOMVrgEbzo0BqCdGjyGL+SMmrAOMrqnRTZamvhgUvE1EJR8+UniFfMlP2OEGr3amQmndPo9N/GBq4TPTlUGWRZb3CvN8uJh3Hn0U++mXKoqGTI2ulKOtUhVyO5ZJxEPFnqX9hFudEE0Ercv0K29hJDno08DTp6tU84z+RfTzMOuXTvXg7ew/OwHZqHOeD4F1TSCUs/iVjfzV7wZp9uW2F4/b/hc+QGprZqtGn8oRsmaeRFv3cwRZWi33yJKVwaujxpEaclLBvpiwzVzGGQXXoIIxxOPHzdPlZF/SM0QTZsjPxZnv1F44eie3fchxRz1y82gDFcLcQPzw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 08:02:37.1857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace1e7d3-834a-407b-593e-08d7717dd61e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4783
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_000420_282990_B2CE22F5 
X-CRM114-Status: GOOD (  34.17  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

I don't want to bother you but I have to start working on that ASAP. I
hope you understand. Can you answer few questions?

The 11/14/2019 14:17, Vitor Soares wrote:
> 
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Thu, Nov 14, 2019 at 12:32:14
> 
> > Hi Vitor,
> > 
> > On Thu, 14 Nov 2019 11:56:00 +0000
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > 
> > > Hi,
> > > 
> > > From: Przemyslaw Gaj <pgaj@cadence.com>
> > > Date: Thu, Nov 14, 2019 at 06:10:12
> > > 
> > > > Hi Vitor,
> > > > 
> > > > The 11/12/2019 08:41, Boris Brezillon wrote:  
> > > > > 
> > > > > Hi Vitor,
> > > > > 
> > > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > >   
> > > > > > Hi Boris and Przemek,
> > > > > > 
> > > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > > to address during the takeover of the bus.  
> > > > > 
> > > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > > I can have a look at it?  
> > > > 
> > > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > > change to make it work? Also, which patch version is this based on?  
> > > 
> > > I'm closing a task and after that I will prepare the RFC.
> > 
> > Okay, can we have an estimate? Are we talking about days or weeks?
> 
> I will prioritize it for next week.
> 

What is the status of that?

> > 
> > > 
> > > I based in all version and tried to pass everything to master.c file.
> > 
> > I'm not sure what that means, but okay.
> > 
> > > Right now my challenge it to trigger mastership request when a device 
> > > driver want to access to the bus but I believe we can discuss that after.
> > 
> > That's kind of a basic feature when talking about mastership handover,
> > but sure, we can discuss it after your RFC has been posted.
> 
> I need to test if the time that device.c request the mastership and the 
> controller has effectively the ownership of the bus is short enough to 
> call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> housekeeping of bus takeover.
> 
> > 
> > Note that I'm not super happy to have to go back to square 1 and throw
> > away all of the work done by Przemek, especially since Przemek was the
> > first one to post a patchset and he never really said he didn't
> > want or didn't have time to continue working on this task (not even
> > mentioning the time I spent reviewing those patches...).
> > 
> > If Przemek is fine with this situation I'm okay making an exception,
> > but be aware that it's not how we usually do: the person that posts a
> > patchset first leads the thing (of course, it's even better if there's
> > some kind of coordination before the patch is posted).
> 
> Honestly it looks like I'm competing on this which is not the case.
> I just pointed out my concerns about this adoption because I see several 
> issues on it. The point is, at the end you can pick some parts of my sec 
> master code and integrate in your solution.
> 

Can you point me to the version of the patch your changes are based on?
And also, can you tell me what issues you faced? I would like to check
if they are already adressed in my code.

> As I said previous for I3C spec 1.1 secondary master received a big 
> improvement due the misunderstanding published in 1.0 spec. I don't know 
> any other protocol that implement such kind of feature and for this is 
> from far the most complex feature to implement in SO based systems from 
> i3c spec.
> 
> > 
> > BTW, you mentioned working on a lot of different topics, but most of
> > them were left unfinished (userspace i3cdev interface, I3C slave
> > framework/API, ...).
> 
> The i3cdev does what we discuss during the proposal of i3c subsystem and 
> only expose i3c device without device driver yet I'm not happy with 
> transfer struct.
> For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> need of a tool for ccc (but for testing purposes it would help a lot).
> 
> > Any plans to post RFCs on those aspects anytime
> > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > that each developer work on a different topic instead of duplicating the
> > effort...
> > 
> > Regards,
> > 
> > Boris
> 
> Best regards,
> Vitor Soares
> 
> 

-- 
-- 
Regards,
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
