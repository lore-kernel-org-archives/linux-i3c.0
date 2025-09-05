Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE7FCAC5A1
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hB/w7NYRACdfm50vB+T+iHBuz4E5w736oIyiWEyTXj8=; b=AnLelXG7AXVhCB
	EL36M1NnRfSzPwzqQtZd8AtTzShwDR990niPkyGYdTG3RORsWkQ/L/W2TCDgFntdty9rN5Y1YBV8a
	jcgo5o9waxD/QeISYvfAddC0mqPjNT60mJjrkSXfg8KAClMxB0BGY9WZo1L2yngfWgLSRQNZDzBQs
	bMyOWsHvVglcL7dqqoG90FbmLwwu8GnchkZp/w5DZjjIbM4Mxy0d2tW/s/MmeIHT8cTpB+Q3E2exc
	DHdo9/YW/wdGJPQp7D/cRcQGOLIKJz2/xjGeipj/vAq+HyU6JcZlELvpwl3vQWlnPEoEqZLhcNhro
	6wHxx8IR8USzXS7HdQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPh-000000029sW-0sNd;
	Sun, 14 Sep 2025 20:33:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR74-000000006qY-2jwo
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 07:44:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so11748265e9.0
        for <linux-i3c@lists.infradead.org>; Fri, 05 Sep 2025 00:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757058241; x=1757663041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Goq8B6iu1BXms7r9OT3/94R7+63Lo0tNCLc694trQ=;
        b=HdlwY+WbkkY04LZyKZZcwppLtqs25VCc8L+5oTwtFDDfYhmgzTGXk9ovH8+1V3Jvic
         xL7KEs9XA3HQKhJZCOT77AjSwJDwQyD4xCnI51n2bSeeKFyPipSfdOZAeQiMSCQd9hWK
         d4oFwTAhGaFbGrk2En/boX3JpGdyvX6S7Eu86AXr5ZReKn/2AIDFynJsUiKMN6TnR5k+
         MBlLLzbKLqL3aHoOXIgx2AxMYccH9iLVWQJ6LSZ2Io1ULgsohNcNVmxL05us/9JpT25i
         dyAJMqUP+Rsw0kkAr+zgk26z4dw9IkT05X4D9slHpYyL5qLZa7anLjkUyfmA5z2aoNYy
         HDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058241; x=1757663041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0Goq8B6iu1BXms7r9OT3/94R7+63Lo0tNCLc694trQ=;
        b=VXqzdkVbEDeK5zLNByJ/APHl6Mj9pVEGRPR6z4sHdPpC6Nxd1ICaY70XAZlwguDAm0
         5OmBI2VdKPMWMonSA28k+Dx8LhE1PCcwaWrSE89dPLNTKGHkAe8fXX4TGLgYnhOVedy4
         /7k5YeWQUR6ugknZSlB3R2EH8XT7NYfH5WS+3VrCsgpK2ymTx6dGhv53tG2i8PAsWAzW
         2TqQOwUCY4qM94w7eFI/A8j45L4AS2pwtc0gaL5joX6K1mGd34FTOX/llBM5D+jcVQNB
         mEpvQw5Lgu3bQcJNSj2IHNzWqM/DBIdGxXCHTj8CB5orko16worSROZ05onsXoskO/RG
         /zEA==
X-Forwarded-Encrypted: i=1; AJvYcCXotR/+euo9HbXn9IqWTe4Y7FtQHku3Eia6E73wSnscv6Dx9193eBiP2ddE6wxhp0Gc4acJn9kStPY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnBIW20uw8EqQNdvkRb40rMuAcTn0iy+G5onyHp02TcgLOgYQC
	ZH5MgiXgATNVvgR2QL1ytHlIjelk0F2/27lrT12R416knY4I8YMIt0m8d6yWfGVmXI3/l/sE1wJ
	kFFRjoLMcN0S+sKUhtNfaD8C263U8FZk=
X-Gm-Gg: ASbGnctfl7caSRChgeCUxhsjRBpN0DqGKMfsRLst4PUCfaAVysTmwQvpV0GN87nyv/X
	ctX06uf2FHZbdd9fdEDc7hXksbIvjnJezKmcxqYOZnkFyp5/9Ueg/Eo0XeAWeQCiNVwFElJVeUA
	eorOTeV1LW5wrFXxIuVtxLsVIXWr7rscgOeLVOK5oIPUwpqve1TNUK2JfgFnoFBaRlQRtXla1x0
	8It3YdRmCYjSYygMdQ=
X-Google-Smtp-Source: AGHT+IEs0sDk7Yw5ukuGeAfjlznKmlUqSEdvVHfRpyhiJhHksA9VkslDAzk+mIR7EIQjI7ZlLC80dl0edVxeg6AjH30=
X-Received: by 2002:a05:600c:3543:b0:45d:d9ca:9f8a with SMTP id
 5b1f17b1804b1-45dd9caa239mr7197005e9.27.1757058240685; Fri, 05 Sep 2025
 00:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLm5kbgRIcomBo6a@ninjato> <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
 <aLnrV0VBVvQ-XB83@ninjato>
In-Reply-To: <aLnrV0VBVvQ-XB83@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 08:43:34 +0100
X-Gm-Features: Ac12FXwduyQu1SOO_ZjtWEAWUhY7RX1CzOvh8slh0GNzlEn65FN3TY8ypxCN7v0
Message-ID: <CA+V-a8tsoTt_543aUsABtrCWzvqxYUerRu-WzUuvZzvZ-cb0+Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_004402_687783_30E53891 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:23 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

SGkgV29sZnJhbSwKCk9uIFRodSwgU2VwIDQsIDIwMjUgYXQgODo0MeKAr1BNIFdvbGZyYW0gU2Fu
Zwo8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4KPiA+IFllcyB3
aXRoIHRoZSBQM1QxMDg1VUsgQXJkdWlubyBTaGllbGQgRXZhbHVhdGlvbiBraXQgKGxvZ3MgY2Fu
IGJlIGZvdW5kIGF0IFswXSkuCj4KPiBDb29sLiBTaW5jZSBpdCByZXBvcnRzIHR3byB0ZW1wZXJh
dHVyZXMsIGl0IG11c3QgYmUgbXkgbW9kaWZpZWQgdmVyc2lvbgo+IG9mIHRoZSBzaGllbGQgOikK
PgpZZXMgaXQgaXMgOy0pCgpDaGVlcnMsClByYWJoYWthcgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
