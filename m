Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39519C30658
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Jul 2024 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjG10GZK+sat8SQuGhQeasMcsl9JsQo8OHfl30csOOU=; b=IKYGAFbA5CJgJu
	3K35jjt0yuwWlLx4arlUe2jgVOjiEukmtXlIsr2r9pDX0GjOLmoQaz+MPhY45qjgQxZRZc+1wTY7D
	JNpjDXHPFEd6vJ5pu3dHna8RvnQ/uKyN8Wjrr9mja3FhvA45TMi7I6FKBmsspSh54zf0XCttg1gwp
	O0IZTOQGjKzgFu6nqgUpuUCO6IuI+CigY3DcxVsgM3PDCa2rWSS5J6zzXTL/JbVWnPCjXHqxFJBnL
	lz/ErKFUDFMuzwV50kjWGzB6k/GV3du1qW2U9gOxRHe1TP9W70A26spEHHhvbXswR7NpcC0xTELmQ
	cIJ+4fudjlkgkZoa1gdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfeS-00000007F1F-24y1;
	Tue, 02 Jul 2024 15:42:40 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOfeP-00000007EzH-0Sx3
	for linux-i3c@lists.infradead.org;
	Tue, 02 Jul 2024 15:42:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 330D360002;
	Tue,  2 Jul 2024 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719934952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kh2++094kq3DmBu80JcmSjBMq3G/fZgQjDvdh0jXcNU=;
	b=jjPJ4A443cEhcRwyZ/TohO8txRrKadPkV/4RoeAI8TrkziRq8HG2O6/tSJtdActGk/heaP
	kf/A5rZUtC+w93nvHyQkuKe9lqkJtsFrVuXJs9d3pF1vdjQf2Op2/dYLQZVoA2tD+pOZey
	3gUyzjSN1fdh1blwg7nJ1loTgBx2vSIT8iIrbZcM/NfhgZJ/vumzT5iRZKTTjQqJSm54C0
	fn6C3pYad+W4DzP42TQgVVWiLie9eG8Edn4JaZyVTEfjoeTnYOQLbPD1okWhfWXUTqHn8o
	BGTwyj4am3sRiXA6m8AuC/y4/Q1S6bMG4d8kYXgvEYvNjNpjvKnRsTYrUHviKw==
Date: Tue, 2 Jul 2024 17:42:30 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	Chen Ni <nichen@iscas.ac.cn>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: svc: Convert comma to semicolon
Message-ID: <171993493884.371587.3917562829848581690.b4-ty@bootlin.com>
References: <20240702024758.1411569-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240702024758.1411569-1-nichen@iscas.ac.cn>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_084237_469553_8B831C74 
X-CRM114-Status: UNSURE (   5.70  )
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

On Tue, 02 Jul 2024 10:47:58 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied, thanks!

[1/1] i3c: master: svc: Convert comma to semicolon
      https://git.kernel.org/abelloni/c/9ea7dc97d9a1

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
