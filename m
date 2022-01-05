Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06EDC433FE
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Jan 2022 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owDUb2VlqtCIQCyQuL/T8G6+LTBb2eDKNpfMP76dd0A=; b=iR8048sCl4iBYZ
	VaDdYa2mWIIR2VBvwlIsaljpmx9E/Fk+zoJMd6D8BOIXzR/doYFynnhy63kOIw8pqkpyudGNY1aiZ
	bsxa5D0okGJxYKoPFnBlLmwqnpLouRyJmnXkjX9wzMXDh5bAHbSy4lgKRc1FqmGXqZnfTl8KtP3r9
	pWq6zE8ahD1JXRaYtZ9NZcBI1wv6xPBb5c4igjKH38hoVKdQNHiHC4YZmfeKQ5CwnyF+yachzEts4
	azhX9V2tyYXVKI0EZ+C4f8M//+d7c4pEVsu1MIxCGaHu08+sWln0KrE8w4z3s+uFKTJmS2xZyuMPS
	KeoRY9LSfEIOH9hxONOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n525R-00EHGk-IE; Wed, 05 Jan 2022 08:56:01 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n525D-00EHCz-QG
 for linux-i3c@lists.infradead.org; Wed, 05 Jan 2022 08:55:49 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9F1EB240005;
 Wed,  5 Jan 2022 08:55:44 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, Nicolas Pitre <npitre@baylibre.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c/master/mipi-i3c-hci: correct the config reference for
 endianness
Date: Wed,  5 Jan 2022 09:55:43 +0100
Message-Id: <164137293677.1744375.2377630941064960433.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
References: <20220103094504.3602-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_005548_012689_F75ED97C 
X-CRM114-Status: UNSURE (   7.85  )
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

On Mon, 3 Jan 2022 10:45:04 +0100, Lukas Bulwahn wrote:
> The referred config BIG_ENDIAN does not exist. The config for the
> endianness of the CPU architecture is called CPU_BIG_ENDIAN.
> 
> Correct the config name to the existing config for the endianness.
> 
> 

Applied, thanks!

[1/1] i3c/master/mipi-i3c-hci: correct the config reference for endianness
      commit: 7a2bccd1a27f0c8fc87e4ed56abd6ea9fa7314a6

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
