Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7291C433FE
	for <linux-i3c@archiver.kernel.org>; Tue,  3 May 2022 21:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fAbUFmI+QtBFSIN93+Jro72hg4ObMC+gVqMbMGA5Kk=; b=r8M6GouxDoI4vR
	vtjZGC18gjbQHn6vq94jQyPVNBuBGcL9C05Str71HszqiwWyaOxGnmTrk3YbPgCATjsEdwoc9CxVH
	c1mJy91JutsMMjG6NUKoeKp586jli1ZXMbZtLuoFrwoKaVJ5j5kZIG9XNSuKzqRrGgxAjKyeSNItP
	nQToPvfxveELGtqtMBCAKgDMSculR8ybpRA1vKnE3sYBusBK+e4hoQZbdJ0QL4+eHP+BzuD24xvGL
	7jvKrgMV5Jw7YHk+ggKeAYM6A8g0J1z9YpwCIrfeOcjZZQyS9Djs5cwRIZLdML3KXGy3P5OMdLUno
	ykJ3NrqeCsnTI39xiEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm0DR-007oal-Ue; Tue, 03 May 2022 21:37:53 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm0DO-007oYT-Hc
 for linux-i3c@lists.infradead.org; Tue, 03 May 2022 21:37:52 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82070100007;
 Tue,  3 May 2022 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651613864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6LTUzx08avjPkNfHjwYBuKNYze9L5g6GFctRWsa/nw=;
 b=CrEeQ/EqwKWpk9BJkglsusY3giBASc2Op7qbMdTJMrPR4xtHzb9zovtPXWtt/32Suxg809
 t92JhVYoMLrp162it3E9/nkKTP28UJQ41fHMmvah/evnApT/uQ7ed+ZuiNH4eB6ooVqMEr
 85iYWX61U8U+fFpeHxWrjgFq4KKQePyDIot5/eKt6nHkUH+Mc9PyY5Z+xViNymSdz0nFoV
 87rC8kSbaCMShyMqAJ+Dfz+We4Un6KEIzS9/VlwVo8uLxXqVyD0JBAT4yZAYRcHK6JrTkG
 uy8/I4YPZLS34ak6s0fEoSIKJ30B/gyo0T+K30X2jogFAe86LgIEdWDZh1kdUQ==
From: alexandre.belloni@bootlin.com
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i3c@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i3c: Convert cdns,i3c-master to DT schema
Date: Tue,  3 May 2022 23:37:42 +0200
Message-Id: <165161385391.974772.13853911429360180678.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422192224.2594098-1-robh@kernel.org>
References: <20220422192224.2594098-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_143750_755459_6BB1DD35 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

On Fri, 22 Apr 2022 14:22:23 -0500, Rob Herring wrote:
> Convert the Cadence I3C master to DT schema format. This fixes a warning
> as it is used in the i3c.yaml example.
> 
> The "nintendo,nunchuk" is not documented by a schema, so change the
> example child device to something which is documented.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: i3c: Convert cdns,i3c-master to DT schema
      commit: 4bd69ecfa672e94334618ef9ec653b2a237cf2d9

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
