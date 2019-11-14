Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9878FC432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:46:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC95206F4
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:46:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QsH4XRxY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC95206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzJdyRgeT0ONlX/6Noep6pPitwC9kapQqzYg6ZoRAvg=; b=QsH4XRxYiL8S5E
	cZouy+Es+q/zvwhywf6qorI7XnWDdq2YWaEbKzRYq39H3LOLcV2CHfFwbb7tBraUsRfD2cnZqsPL0
	yWJ9Z2mtKiwgHWocCbkJDFHapBecKNaOecmkoqCEBl3yRFg0uSoK8wEuDUm148dcmlk5HgZpwNNzm
	hzz1SW0/4eupJ47fUULkE/RPP0/aNmdzFxST+wTxPP1NTsTt7yh6JheLgeJqN1OI8XcPHQXwbVcMq
	kkuINdkDpA/FO6sRmHH0qiELW7B7CEHTTp1hgrC+R0buHYUWYck7S5PNurpXsR+boROYAL1ajNAiR
	RzuVcLRhg4VcP5y33rVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVFRz-0002IX-4l; Thu, 14 Nov 2019 13:46:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVFRt-0002Hu-KL
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 13:46:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF83F2916AE;
 Thu, 14 Nov 2019 13:46:11 +0000 (GMT)
Date: Thu, 14 Nov 2019 14:46:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 0/3] Add data hold delay support
Message-ID: <20191114144551.4187734f@gmail.com>
In-Reply-To: <CH2PR12MB4216672A1434669746774917AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <CH2PR12MB4216AF4224EDEE99E6C4B74FAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114124855.GA13588@global.cadence.com>
 <CH2PR12MB4216672A1434669746774917AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_054613_794688_750E7DBA 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "agolec@cadence.com" <agolec@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 14 Nov 2019 13:31:33 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi,
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Thu, Nov 14, 2019 at 12:48:56
> > 
> > There is new controller functionality which allows to meet SDA to SCL
> > propagation time. Baisically, you can delay SDA propagation using this
> > functionality to meet I3C MIPI spec timing. This is very useful for some
> > SoC designs.
> > 
> > From Spec:
> > Table 75 of MIPI I3C Specification 1.0 (page 142) defines non-zero
> > minimal tHD_PP timing on master output (Fig 65). This setting allows to
> > meet this timing on master's soc outputs, regardless of PCB balancing.
> >   
> > > 
> > > Best regards,
> > > Vitor Soares  
> > 
> > -- 
> > -- 
> > Przemyslaw Gaj  
> 
> Thanks for pointing me the right place to read about it.
> I would suggest you to put that info in the patch as well.

I agree. The spec details should be mentioned in the commit message and
in the code as well (in a comment).

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
