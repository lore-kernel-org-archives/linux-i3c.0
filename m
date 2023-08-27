Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A567C83F10
	for <linux-i3c@archiver.kernel.org>; Sun, 27 Aug 2023 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sylyMeyz/OjVz8YquzNH3akfulCCfXs+JyHEr++y9aM=; b=IRrz3rmyz/JK49
	kjUBM1fZ5S+K1d36gMYrJaQ3nBg666aEqDIrO/nfdRk1zWXncB2h345IehKAssOqbSzx5IxtfKbz+
	6Bmx78ZZTp/pVUoU6oQa3jnm6yipWW6+f+WYuYWK0hksWpVMaao80MISIxYwktjMs0D7Rl6gtHQPC
	wg+1kn8O/xgcjZi9xUgDHJoa53xvMNQTp1mAW811fSHS8GMl3gWOZK1VW0m7HHeabbXyCbn6N/orq
	/1QBJVIXi2B187bnsilEPaEZEoEorAwHVZlw9aFlPDNI1TV0nRHaoFlbssK12P7CKbeRbHXqUlZs2
	vfrJy0DbfdhUQjbqFVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOVv-008WxZ-1D;
	Sun, 27 Aug 2023 22:45:47 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaOVr-008Wwj-1f
	for linux-i3c@lists.infradead.org;
	Sun, 27 Aug 2023 22:45:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41EEEE0004;
	Sun, 27 Aug 2023 22:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693176336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dozuiHFWVmwXy/XjSULVyK7tV7sAHAuCVEVPDVdbkrA=;
	b=egWOuQ7au4VP2cYnhvdtarFdFP1V5aHgAf3gFp2PQkqW7GOnV30IF1DqER7pyW0Zo+VB6u
	QTf1DUYjQgza9xq14na6rzrymnlciuUDBPYnFqkZYB3Ottqr8XPVSiSvMgdyRVdKrKsdZP
	JvELY00bVSI0TizzZ7sgFefgYKnc40ROWn9Jyo6PDBIdsOhkRdVhLol4C4Kgsp1df12SKZ
	FXaM6APUFPyLeNDbeAa79h0ufZZlAXQwGEF42DE5a+P49cmDuQ4nNWDZ8uJVt9hj1kgygA
	6+9SnHUyBrwEWvx/wZqMqsrwLolwh9kK0q4JxSlyVn0g/2GZdHlV2EpCAHudWA==
Date: Mon, 28 Aug 2023 00:45:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, joychakr@google.com,
	manugautam@google.com
Subject: Re: [PATCH] dt-bindings: i3c: Fix description for assigned-address
Message-ID: <169317630418.562439.4628786119246659411.b4-ty@bootlin.com>
References: <20230822051209.2837818-1-aniketmaurya@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822051209.2837818-1-aniketmaurya@google.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_154544_184340_748D60F3 
X-CRM114-Status: UNSURE (   7.66  )
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


On Tue, 22 Aug 2023 05:12:09 +0000, Aniket wrote:
> assigned-address is a valid property for I3C device with or without
> static address. Fix the description and an example for the same.
> 
> 

Applied, thanks!

[1/1] dt-bindings: i3c: Fix description for assigned-address
      commit: 32e6b31a6a80ba9493fad802d68d41f4d63230cc

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
