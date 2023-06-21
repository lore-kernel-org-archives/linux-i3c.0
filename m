Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3520EB64DD
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2b39cnZzEvlqm5dhcujT13pEjDgMhvYcAg4wOmg59TM=; b=bWhRlmnwTmkh9s
	c+BQrdnO6kGmAwiaU+CsJShzdkJM4Mvw0HGuNl+S+G72dgOzIN49ezwuhi6ki9UaJWCWrFXeVfMjK
	nnM/X+nV+BsbYUHg8ERg/YVai2nwTMnQrfQhoIEuLGhoSnPZOqwrOT6ifz3gFWfcBi5biW048MEF+
	WTUPJF409LYB3l73FfK8ZpYZUSzPZgz8cRbQlV4DZPuXZ3H3FfbyCKN6vrTrltX7THuchmLqgYySH
	9Zdk1XzxUdIXqfsHZ+eBNMgMWKDmfAUZUEajuTuY9pjlWypnvSxU8NbP3h2sYQz08WxAAXICNCmUr
	qze9gQ/rnovTgop9rWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEohr-000fpu-1s;
	Thu, 29 Jun 2023 10:16:55 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0Z4-00F464-0T
	for linux-i3c@lists.infradead.org;
	Wed, 21 Jun 2023 16:20:16 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qC0Yw-00CSao-DZ; Wed, 21 Jun 2023 17:20:07 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1qC0Yx-001z4O-00;
	Wed, 21 Jun 2023 17:20:07 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 0/5] updates for i3c error printing
Date: Wed, 21 Jun 2023 17:20:00 +0100
Message-Id: <20230621162005.473049-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_092014_179627_278733A7 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 29 Jun 2023 03:16:50 -0700
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

During work on an i3c compatible system some of the
probing does not produce much useful error output. This
series is an attempt to add error reporting where it
would be useful to track down the culprit.

Ben Dooks (5):
  i3c: show error with node for invalid reg property
  i3c: add error print to show device failing during populate bus
  i3c: show node when printing unsupported 10-bit i2c dev
  i3c: show error messages in of_i3c_master_add_i3c_boardinfo
  i3c: dw; add print if cannot get resources

 drivers/i3c/master.c               | 28 +++++++++++++++++++++-------
 drivers/i3c/master/dw-i3c-master.c | 12 +++++++++---
 2 files changed, 30 insertions(+), 10 deletions(-)

-- 
2.40.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
