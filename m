Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D5AC4332F
	for <linux-i3c@archiver.kernel.org>; Sun, 11 Dec 2022 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQFV/mAoCsXSmdiyx20JGbgH37wBlqD5B/Aql8Q4ib0=; b=4F08Pmk7ofnP8P
	X0LeiRAS6spOsgxb0PBpbYSQqAzhAUwVM7/9D7iSNw7VNvu7HcPPXbO40gUpULDktlry7sqNOeweS
	TqacaphMa3fgabzqzPiyEPIJkmFqEsmHOD9KqcJ+AExwC92hCREdPcfMGiuuxAvFdBV27NbrCvYtp
	RBwHhPxatZfDQ70KTA24APoBnrdhbsm6MR9IEzJt1gdvs08V7l3WLsVHa8bln20jYBW+vb1rgFu2e
	qmt9cl27SQ1FJK9B6EuLkyIde0FGwuKziWY6k9ZLwxbFkijq5Iy3mAm86JmDC0+dKH2O1IlygTREQ
	EP2iSwjntbGNSJAdG51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Sqk-003v7h-Kr; Sun, 11 Dec 2022 20:23:03 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4Sqg-003v2k-V1
	for linux-i3c@lists.infradead.org; Sun, 11 Dec 2022 20:23:00 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7AF6FF803;
	Sun, 11 Dec 2022 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670790173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jTZf1uBp49+8nSBFwb8wjlr7frwcrl8n0T2YsoAvuz0=;
	b=mqliGHOowM04/hnk+JdnRDgf2e/fjeMOhvMFrax12T7GLG8786kzzu87tUNLTS5BlMmHj4
	y/mfZ+C/CjwSOq0dxacTbEcpG8h/jLtYw1HIGCa48RuvbZ8GF1qv2gDyhFrMuShBZaMhFm
	vYH/lDZKScFsoSh0Lw2YQEQq1XPcDlnlMVITgZ/G7qePGynll7X8MhftLKnp4k5fI5mOB4
	5Dv2VpfNF4fhGegL0YFutxFJvUgApzOMETYkLJkoG2UKItNMyFzD6ahhrCftROmut+5Xgw
	OtCdvhTl8OOapIn7+mL2voE1zgHwlxtgFUOfHEsYzHZxxZzhR61wCwJsIhytVw==
Date: Sun, 11 Dec 2022 21:22:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Cc: Akshay Gupta <Akshay.Gupta@amd.com>, boris.brezillon@collabora.com,
	linux-kernel@vger.kernel.org,
	Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH] i3c: Correct the macro module_i3c_i2c_driver
Message-ID: <167079004538.14691.7411533712830110328.b4-ty@bootlin.com>
References: <20221205105413.937704-1-naveenkrishna.chatradhi@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205105413.937704-1-naveenkrishna.chatradhi@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_122259_352411_B46F26EF 
X-CRM114-Status: UNSURE (   5.14  )
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

On Mon, 5 Dec 2022 10:54:13 +0000, Naveen Krishna Chatradhi wrote:
> From: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> Present definition for module_i3c_i2c_driver uses only the
> 1st argument i.e., struct i3c_driver.
> Irrespective of CONFIG_I3C being enabled/disabled,
> struct i2c_driver is never passed to module_driver()
> 
> [...]

Applied, thanks!

[1/1] i3c: Correct the macro module_i3c_i2c_driver
      commit: 01744ce9f07f0b76b0b2d30adba2a7c104f1ff2a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
