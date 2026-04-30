Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4041FF8875
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Apr 2026 10:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNex2BYb4QBZs4pcpPQd3uUYRw1psBudmcm3W6PLZxA=; b=Kd1IC7LGZDGuzx
	Razq3a7j3eMbQ5F1VC5EI2G6mfKwoqyU4kA1s7LWxEyrVFCS1APmksqtkpFjNBi/22tHTHekpaQBB
	tOmq1/P3QNBNltKiJj0nwt3j/PBLCzVYTPGSPzM1z5cTRRqyjoJtl6VBKI5vvOyNlicVD1S5/AH1M
	jhQ4F/loLPApPf1833FR9U7zSfp2sUtL+efB1fFYY1VOzhwpUVWRux6G/RByYPZC5PKVH9NcypGcY
	dU1o0Yu4wjRaGyB1pwiRtWrTyox7WSQGDYv3Xg4NXkyVSGh7rGmXeQ1CSkWouwDqSBOW8GCyAevZk
	vQEWaN7Srpqs3mjMyhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOEa-000000059mA-1zdQ;
	Thu, 30 Apr 2026 10:03:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOEV-000000059lY-1otP
	for linux-i3c@lists.infradead.org;
	Thu, 30 Apr 2026 10:03:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AC27A1A348C;
	Thu, 30 Apr 2026 10:02:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7998260495;
	Thu, 30 Apr 2026 10:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42AA31072B8C9;
	Thu, 30 Apr 2026 12:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777543376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=5hXv2AXkgxdlx0sV95pPdwKaPOBesgLAj4xeoOCpMbI=;
	b=Y+XaVRzFf53cGoqs6MO10EtsKo166jtdT+9CZ4T8Wqd8l0O5xHSlBot8Bt6anDqPBeUFWU
	vCcRnizVAzut1NUIbUMGqVuoigdSbLihnXcC9KjqjMy2TUaaxFaO5PcCslS80iAXbVuujg
	9PhhGVgwHXYNyAO+TF+Cn8bE+BhMLCbYrURa3x2XWLUfXpWMqTjf8iEtEs2AWlFRlFVcut
	G213I/XftKJ1ubcjmG1zu4FGj8TskMRkBnzw0GNXoNoVpw7OvHQ7Go8hFbuDWUNw5n89Ku
	frQ0yxTUQcJ9dX1GdXn/T+woKB7+tMDl+ZBkYLkgnIqm6AApiDeB71sCn59QhA==
Date: Thu, 30 Apr 2026 12:02:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i3c: master: Replace sprintf() with sysfs_emit()
 family
Message-ID: <177754336866.576526.16580697568251279737.b4-ty@b4>
References: <20260421214837.20939-1-m32285159@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260421214837.20939-1-m32285159@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_030259_625939_F86E8798 
X-CRM114-Status: UNSURE (   5.42  )
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

On Tue, 21 Apr 2026 16:48:37 -0500, Maxwell Doose wrote:
> Replace sprintf() function calls with sysfs_emit() and
> sysfs_emit_at() function calls where appropriate. This will help
> harden the driver and help modernize it. While at it, add missing
> newlines at the end of some sysfs_emit() (formerly sprintf()) calls.

Applied, thanks!

[1/1] i3c: master: Replace sprintf() with sysfs_emit() family
      https://git.kernel.org/i3c/c/14236919b0e6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
