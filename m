Return-Path: <SRS0=EJcj=BP=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABCAC433E0
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 15:13:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7512333B
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Aug 2020 15:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwBrh3Kr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="Xln+P+yx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="jZLFbTc4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B7512333B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=knMqFfq6vQYB7gyeN8QXKdrpbtMeW+WYQuTwoLiRFgM=; b=OwBrh3Krq4nPA+gmkUT14Y4XP
	VRPB7dWhrN9mo+S1AdXE4ZkkhtB7xDPdXsOTYs4mDUnMrJ0Rq+DkxFbX2RPuYiRwY3eAzd+f1mPFY
	6Fu17Vbvj/iVf1HvQ6baPyKTDEiHjBSXc/8t4rU75mEKngnSMjaCkk5XFyfglcGZei8eeunTRsPwW
	jUGIXIdcPcDPzsKvq2Bo8LYeHqMT4VyLizXceylM5V7hkWrs+9C09g6QLQ0c313snmxZAwe9OLnLR
	eHAsYfmdTrRJBPRL0+xkVIGmVbul+x2DJwOewrTFkxJ6ZmgkoCv+xSHREAUPz3zf+ebNlGttLULC0
	pycU64zAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3L77-0004jJ-FG
	for linux-i3c@archiver.kernel.org; Wed, 05 Aug 2020 15:13:57 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3L73-0004ht-KR
 for linux-i3c@lists.infradead.org; Wed, 05 Aug 2020 15:13:55 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 3153987992;
 Wed,  5 Aug 2020 11:13:43 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=t4fVhjQVDWtzEETmfxy67PMJ+aE=; b=Xln+P+
 yxlSY/84uqmszJffyoR/qH2KB/720zEYc/zh05B9w6FYOZo4SNr9h8RIRD9YGwUd
 11XTHGNxdeatYBx7fwQRKn1KMzxfvb1+tEQj7ZOISPLsts5x+dWLdNJC25uO6khI
 B+/WIr6D7qtNubL+35i4I2hjOMe31sYeorLtc=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp2.pobox.com (Postfix) with ESMTP id 28FEC87991;
 Wed,  5 Aug 2020 11:13:43 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=Cvq6oQrzezpY4LxASPSDQy3sp0oeiiOQ+kGdMlRFHB4=;
 b=jZLFbTc4/NjzG+eJj6EfBs0AT33scg8HOgZvS0M5ev35O9kw6hCDbVnZHJr7GRhvS4AXf1ayxSbZqCUXBnU8mD4YbXbkqVt9Qtt48z1QSieFOrL5wCXG2xJOz2hMROcuo+zeGXbk7SKI2a7+E5OMeNcaERHPAyyuHU/tojg6Kvw=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 700B987990;
 Wed,  5 Aug 2020 11:13:42 -0400 (EDT)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 380822DA0AA7;
 Wed,  5 Aug 2020 11:13:41 -0400 (EDT)
Date: Wed, 5 Aug 2020 11:13:41 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Conor Culhane <conor.culhane@silvaco.com>
Subject: Re: [PATCH 3/4] i3c: master: svc: Add Silvaco I3C master driver
In-Reply-To: <BN6PR16MB1762D6CE430AB08B7A2BE5FCF14A0@BN6PR16MB1762.namprd16.prod.outlook.com>
Message-ID: <nycvar.YSQ.7.77.849.2008051105550.1112668@knanqh.ubzr>
References: <20200709080159.2178-1-miquel.raynal@bootlin.com>
 <20200709080159.2178-3-miquel.raynal@bootlin.com>,
 <nycvar.YSQ.7.77.849.2008031546570.1112668@knanqh.ubzr>
 <BN6PR16MB1762D6CE430AB08B7A2BE5FCF14A0@BN6PR16MB1762.namprd16.prod.outlook.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 3FA9ABCE-D72E-11EA-93F8-2F5D23BA3BAF-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_111353_960110_D6417CCE 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rajeev Huralikoppi <rajeev.huralikoppi@silvaco.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 4 Aug 2020, Conor Culhane wrote:

> Miquel is passing 0 as the delay_us argument.

Good point.

> Is this still a concern?

Not in that case.


Nicolas

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
