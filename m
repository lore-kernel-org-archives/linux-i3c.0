Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129BFC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:28:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D551220836
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 12:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ec3tg1Kh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="GlmevoKq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="KcycYEpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D551220836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MErKu82qLihsXPXASGz/Hm6lUeADvWfqiH35ZgdxL2Q=; b=ec3tg1KhZnfQzs
	nf1h8jIiVbFRBaSYkd7N7HaPtU9yUs6ZsMz4gemOsGtGMVBAPVC6ulk7sSkBLmz1+rCj1lcM4a3yH
	1Uz2EnmBKvlVHJtzg3KXbp7jUI3kPoH8tSFOsXsD3zs/uhtoxsLbSjiD/o7m5io1fhYgOGsWKLzAL
	BafwzVSycCYpWeW6b0bDvSc16j+wtGoo8jeuNg7c9fa0Qt3cLAxAU7owFkX4VhBm8RRiAKiDaFRfP
	oJsPAswU9VOZNgZDcOh4/qlxRd2mndjQ7HYHPraMha2agSjfRud4OGApIgUq4djcWlzXXSAbB2YZ/
	faaRRYPMDR16e4bB82xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDTW-0001IC-Au; Mon, 25 Nov 2019 12:28:18 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDSm-0000bj-CK
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 12:27:34 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPCOCOx002618; Mon, 25 Nov 2019 04:27:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=c0SiLIfVuWlqsBebplB4QjIDGpFpJ/nToRvar8rNiK8=;
 b=GlmevoKqXXPARIkNKN8oSjcGOGuSNpwVPbx9EBmmuSKzNniDXZuw2DAslEAYcKVngVb8
 zbm4UfvPwWJKaT60AUO5NVylelu7dKcxuiR3mzrCD1O/zr4NDTMrNQTsY7YzGWo/v+Xy
 rLkfoJ4uUz/Tn8D8iRU/JevHfYno1jTkageFR3oo+Epv8L4mA6gKijcLHEpiKfETFbYC
 4cJcANOeOXUgE+6J2+eZeFfBVKkR2bYyLSj6JJLeP6Vx+LoTt5K5yn9XwPKssnfHDt4w
 NKjODTdjerAW/HkE5sI6c4i22NgH3XfLsjnwJsdyoHTQ6hKG9BYvyxYFkBrsP5y8jdf5 Ng== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2058.outbound.protection.outlook.com [104.47.46.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2wf180713e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 04:27:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwN5B6N5ZTByfWHtmJ8CMX43Z8FbM0ge7949+4uPgsHwk2vzqNrN+pOaC7s7GdcavudNErzqixDoG4grs1AU8CNAayzYiYGNT+TDZv4O37boB9izj5LB9SN/tmqDUISiNkB3KK8nKuZXi8KOpbm8xMd3fZ9R2+jPWbqqVnditEIk7dBmycj8OfvmVA6rOLRyoLd9Y4ildO7LLrmINWqsFsvLalp0am5ArWC7NRT+PVrFdjnW9K10V7L5HYig57K+dckvIeJX/cKvbNKoNFdNfXGw1Dijr8VSUFUEqtPfijOGIg+04j3qEdnTJMvFqN+abqRp0Duh+VatgwpWWgV72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0SiLIfVuWlqsBebplB4QjIDGpFpJ/nToRvar8rNiK8=;
 b=LDrwoG6wruwrgoLXDzMIP72c8T5laq59/4Jv0xkDIwniXUZFc3aC2SN3+nl2zIz2lttBi5dJnQl94mF+gnS6bTn72WZzk1awD+WVUI2MQ5FU2lEPRmts3g4y8Tp8eWIG/PxEjZz4dtZ8//Nv8hqTrVqYTL8BcdUMpbAM9xGpRkwcaWvYj6itKJqIz0C8T8LxG1oqex8pENB07Br2nYjUCS7PZKYT54RRhLP8auWBo1TP1dMdvYZF6861lf+ZmEcSSrTLNHCEqpTarx2bOce4fYV5ZsuWuEObIbX4lJMVgSciLc2vvWy+FtpUhJB+4bmo7unQTly/lMU5bA+ycPFONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=collabora.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0SiLIfVuWlqsBebplB4QjIDGpFpJ/nToRvar8rNiK8=;
 b=KcycYEpVJ4113L9Y6v57Lii7FXm+CuXVziW4QAJzPLykogx3hep3BV605QHgQ1eIs51HbX/wIi9CTQ1jYU+X0Lg73QKwo6Et95cRj9jAKy0cz7YojiT9XPYHZMPzl5tpy91hUW/HM7QGPc1GgRmjWpIQB3AnBDIUPxbwY4Q8f/Q=
Received: from BYAPR07CA0070.namprd07.prod.outlook.com (2603:10b6:a03:60::47)
 by SN1PR07MB3902.namprd07.prod.outlook.com (2603:10b6:802:24::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Mon, 25 Nov
 2019 12:27:23 +0000
Received: from BN8NAM12FT007.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::207) by BYAPR07CA0070.outlook.office365.com
 (2603:10b6:a03:60::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Mon, 25 Nov 2019 12:27:23 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BN8NAM12FT007.mail.protection.outlook.com (10.13.182.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18 via Frontend Transport; Mon, 25 Nov 2019 12:27:23 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAPCR9it011943
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Mon, 25 Nov 2019 07:27:21 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 04:25:27 -0800
Date: Mon, 25 Nov 2019 13:25:23 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125122522.GB5777@global.cadence.com>
References: <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36092001)(43544003)(199004)(189003)(26826003)(305945005)(316002)(7736002)(478600001)(956004)(7116003)(54906003)(446003)(6916009)(16526019)(186003)(11346002)(26005)(6116002)(8676002)(8936002)(81166006)(81156014)(3846002)(2906002)(16586007)(336012)(53416004)(33656002)(23676004)(561944003)(50466002)(2486003)(76130400001)(76176011)(7696005)(58126008)(6246003)(426003)(55016002)(6286002)(6666004)(356004)(47776003)(66066001)(386003)(1076003)(229853002)(86362001)(4326008)(14444005)(5660300002)(70206006)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR07MB3902; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b58b44b-3d71-43be-cb19-08d771a2d2bf
X-MS-TrafficTypeDiagnostic: SN1PR07MB3902:
X-Microsoft-Antispam-PRVS: <SN1PR07MB39023C496BAC17FA10815212C24A0@SN1PR07MB3902.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNRVvUOo0KxZr3Bw9gIjvWIf50ZXzqepvtcO/sptPxcOKwLN5b06WjDGhmFL8pq+wAj4UAk4rQw6VT38shNZERkuaQ+Pr04MnD3hlQCJ3g5PO9QKiiY13pDIui+UnBV5n5knLEqA1oJNQIoRZSDj1fl2iV2hYf6teyNPc9QWkRbo8t+hj5ZEIEJ1OnoYB0wW7p+STkpt0qmBIUd/7TXJy5wqPzCIgCffGl5L9PkVXTDR51zaXtIo87oQVMVWzrnHq83hsjEoEbCSyE57LubJ5+sJ1OXQ+ed/MjW4b57T581jy23xHEr5iuAcrovcxiB3YKUKYktAH+pjyDO8lgE6ysxDLe6jVKzK6/m3vztyw/c7c2sxhWF0ggkVs0/u4FNknXbVFG0954fpSgchy2Hh3zhZM+kam+KkQawZyyG8/dk3RnYudVPu1Jy+Zjiw2f7pNpee6uzv8pi9ALf6acP30A==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 12:27:23.0369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b58b44b-3d71-43be-cb19-08d771a2d2bf
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR07MB3902
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_042732_564894_F2877AF9 
X-CRM114-Status: GOOD (  38.34  )
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

The 11/25/2019 12:03, Vitor Soares wrote:
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Mon, Nov 25, 2019 at 11:55:16
> 
> > The 11/25/2019 11:42, Vitor Soares wrote:
> > > 
> > > Hi Boris,
> > > 
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Date: Mon, Nov 25, 2019 at 11:34:52
> > > 
> > > > On Mon, 25 Nov 2019 11:19:44 +0000
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > 
> > > > > > > > > 
> > > > > > > > > I based in all version and tried to pass everything to master.c file.  
> > > > > > > > 
> > > > > > > > I'm not sure what that means, but okay.
> > > > > > > >   
> > > > > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > > > > > 
> > > > > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > > > > but sure, we can discuss it after your RFC has been posted.  
> > > > > > > 
> > > > > > > I need to test if the time that device.c request the mastership and the 
> > > > > > > controller has effectively the ownership of the bus is short enough to 
> > > > > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > > > > housekeeping of bus takeover.
> > > > > > >   
> > > > > > > > 
> > > > > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > > > > first one to post a patchset and he never really said he didn't
> > > > > > > > want or didn't have time to continue working on this task (not even
> > > > > > > > mentioning the time I spent reviewing those patches...).
> > > > > > > > 
> > > > > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > > > > some kind of coordination before the patch is posted).  
> > > > > > > 
> > > > > > > Honestly it looks like I'm competing on this which is not the case.
> > > > > > > I just pointed out my concerns about this adoption because I see several 
> > > > > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > > > > master code and integrate in your solution.
> > > > > > >   
> > > > > > 
> > > > > > Can you point me to the version of the patch your changes are based on?
> > > > > > And also, can you tell me what issues you faced? I would like to check
> > > > > > if they are already adressed in my code.  
> > > > > 
> > > > > I used v3 and v4. From v5, I found useful the switch case (request, 
> > > > > deliver, handoff, takeover) in hc side.
> > > > > 
> > > > > I didn't hardly test how device.c request mastership but I suspect it 
> > > > > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > > > > not be the master yet.
> > > > 
> > > > I'm pretty sure we solved that already (that's what
> > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > Can you be a bit more specific? What makes you think the master might
> > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > called?
> > > 
> > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > secondary master already owns the bus. Main master can ack the MR request 
> > > and not send the CETACCMST immediately.
> > >
> > 
> > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > status and after I exit from ->request_mastership(), I'm the bus owner.
> > If not, error exit code is returned and we can't make the transfers.
> > Are you able to implement the same behavior?
> 
> You can assume everyone will do in that way. What happen if you receive a 
> request or an information from current master?

1. By default, my HC driver rejects incoming GETACCMST, just nacks that.
When I want to request mastership, I'm enabling that using MST_ACK and
secondary master starts acking GETACCMST. I can extend that easily if
needed to ack GETACCMST by default. Just need to handle one more irq.

2. What kind of information? DEFSLVS?

> 
> >  
> > > I was thinking to delay i3c_dev_do_priv_xfers_locked() with a work delay 
> > > or so. Do you have any idea?
> > > 
> > > > 
> > > > > 
> > > > > >   
> > > > > > > As I said previous for I3C spec 1.1 secondary master received a big 
> > > > > > > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > > > > > > any other protocol that implement such kind of feature and for this is 
> > > > > > > from far the most complex feature to implement in SO based systems from 
> > > > > > > i3c spec.
> > > > > > >   
> > > > > > > > 
> > > > > > > > BTW, you mentioned working on a lot of different topics, but most of
> > > > > > > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > > > > > > framework/API, ...).  
> > > > > > > 
> > > > > > > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > > > > > > only expose i3c device without device driver yet I'm not happy with 
> > > > > > > transfer struct.
> > > > > > > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > > > > > > need of a tool for ccc (but for testing purposes it would help a lot).
> > > > > > >   
> > > > > > > > Any plans to post RFCs on those aspects anytime
> > > > > > > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > > > > > > that each developer work on a different topic instead of duplicating the
> > > > > > > > effort...
> > > > > > > > 
> > > > > > > > Regards,
> > > > > > > > 
> > > > > > > > Boris  
> > > > > > > 
> > > > > > > Best regards,
> > > > > > > Vitor Soares
> > > > > > > 
> > > > > > >   
> > > > > > 
> > > > > > -- 
> > > > > > -- 
> > > > > > Regards,
> > > > > > Przemyslaw Gaj  
> > > > > 
> > > > > Again sorry for the delay. I will try to send this soon.
> > > > 
> > > > Can you please share what you have now (even if it's not finished) so
> > > > Przemek can start looking at it?
> > > 
> > > I will try today.
> > > 
> > > Best regads,
> > > Vitor Soares
> > > 
> > 
> > -- 
> > -- 
> > Przemyslaw Gaj
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
