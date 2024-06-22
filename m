Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0C9C27C53
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkIBrrqnGomk1yTxWccQT95aIcaBHu5thD3wsMMtqwo=; b=lczYkXNOwJDaRJ
	MrMq4qfBqFzZaWaWFcfZrvS/PN8C0nKaaSfuokVoWimcZ5AHaJdBxy1qPXVklbNxn0zWF98NkcCc7
	k2FQX1VDGHULj3fBCAmIKvyDJLrWT3Ny4L23XoucoVLdyuF2Ur857JxVjvkSZD2iCa+gk0FTqs8b1
	eZLMYS8WL78GadvxjEGQB/hBR5sGGCBpQpKM3d3iuJtgNv2GoBE9JQR8vZoyqc3h9iTcevlp2o8tA
	CwtFJW/GvT0s9s4pr6QmMabBa9QC95HZ49PLgMNwsFdcYhPGU78lSni0VDo9ohrkNi2DIecp3i38c
	DSMwFfGlrxhLsirmCiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9KQ-0000000CvyF-3yvX;
	Sat, 22 Jun 2024 22:35:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9KN-0000000CvxZ-2WHT
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:35:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E37C2E0002;
	Sat, 22 Jun 2024 22:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JzqpThDvqrjJmaXYIlAKEDZ4I8D6/j2Y6Ud0k80pnOw=;
	b=eOJWqUg5+t7ngGhuPqRaMacqYZoeWfZ8v4m3REYoPMRrC98GpIBTh9c2+a3spjzxEogdkC
	dR3CQOjHdyfE4xNkmPvTWSlBhcemTAjwHLPBL1WC5F3Ukrz2wC7QKegszjAcDKCI0XMclr
	q7vwfHRNqI0QB3Y5fk1S+U0v7LSmDkXjR6Flt9JHqAp2ZOOF+isldx3xS9/lzymsRDAAv8
	JHQ680db0pkaCI5/eZhVK0A9o2UAPvF/um30IGyhKoAcfQb71/vWJkIPNnKeGsTDwjrYSC
	11AVSSOMROAqNHG25k4CqQeQyvqD/ZtoFLnJ3A5voz/24lPZ/gFF3dZOO9DPHQ==
Date: Sun, 23 Jun 2024 00:35:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI
 versions < 1.1
Message-ID: <202406222235206676ddeb@mail.local>
References: <20240614140208.1100914-1-jarkko.nikula@linux.intel.com>
 <171909557751.2164405.18080145631407814648.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <171909557751.2164405.18080145631407814648.b4-ty@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153523_812749_04961985 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 23/06/2024 00:34:01+0200, Alexandre Belloni wrote:
> On Fri, 14 Jun 2024 17:02:08 +0300, Jarkko Nikula wrote:
> > I was wrong about the TABLE_SIZE field description in the
> > commit 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes").
> > 
> > For the MIPI I3C HCI versions 1.0 and earlier the TABLE_SIZE field in
> > the registers DAT_SECTION_OFFSET and DCT_SECTION_OFFSET is indeed defined
> > in DWORDs and not number of entries like it is defined in later versions.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
>       https://git.kernel.org/abelloni/c/17bebfeab08b
> 

Obviously, v2 is the one that has been applied...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
