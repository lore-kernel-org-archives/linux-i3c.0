Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E16FD7F8E
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 10:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3J+R6upetG8EOm42HafFps7u1JIQZf2YKD7Jh3MWCtQ=; b=RIEHH25l4gh9cl
	Y5XoK26u2lZnWrceyO3ZaV6Gt7rNnpIVWyfJ5+eub1gkMS7met6Zig1kh2hKZBmyu+V0vIYVpCtLp
	ltYt+rKjj2qBcfgik6JV7oStgE1XypTEzh2xdzYEmPLUsOh1cH+vW2xWcNIZ+79YuwpefoJsyAqDE
	UNwDt1zZucqwpbP/H2CHlfhpcfNhqpe72gXN5A81FPYlIeP035rWyz+wVYU/lBNT3VF/JBV3E8dc2
	O5xbuaNppLfXPpDN2YSztv91cka+vxeCzRwhiGWUlzwpsQH0xbR3GSM98b6OI/BP1XRVG06pKfehM
	InNWT+oUE5w/P0v6H02g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuyx-00000008EN3-063c;
	Fri, 27 Feb 2026 10:22:03 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuyu-00000008EKy-1VBf
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 10:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772187677; x=1772792477; i=markus.elfring@web.de;
	bh=5w9tfWPJ/J8tNpSjjkxWmDR7Z6rsSRPdTJ9yzFd/T3c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EIrLnBaLsLkZmfcp2dGeTAS9QozKWU4g3ShRn9G+bC0U3osqPSdBQKx6sAwNLRAj
	 kSx/1KA7fGomcR8gZoVQwlRgLVBEg/K9Avt6jpCaw5Zlrl9LwdRd7zr+fig3iARur
	 y6S3ZpzYx4BBs6mie5Eyls+blVbruGSMIA+bsxyHRYZgXVQTFvtKc6HSKBOuNgOTy
	 zZG+GLr3C2PEfQ6SO+MqTHcSBN+Rqe+iAKImk5PEmPhSbNikCLVB+J8/7RCUq5/sX
	 FDERidVbfO9T7zBUu4yfDu76r8JPhtDLL2tSGZDS4CBvcbfJmrEdsuCJDWJQxXKIQ
	 QX7q7dBMlqPMGEm5Ng==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MG9DC-1vumNV1t5o-00CZSl; Fri, 27
 Feb 2026 11:21:17 +0100
Message-ID: <2411a872-5bf5-4353-a754-47fa54d69c46@web.de>
Date: Fri, 27 Feb 2026 11:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-i3c@lists.infradead.org,
 Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Fredrik Markstrom <fredrik.markstrom@est.tech>,
 Ivar Holmqvist <ivar.holmqvist@est.tech>,
 Jorge Marques <jorge.marques@analog.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Zilin Guan <zilin@seu.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, Aniket <aniketmaurya@google.com>,
 Jianhao Xu <jianhao.xu@seu.edu.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] i3c: dw: Use more common code in dw_i3c_master_i2c_xfers()
X-Provags-ID: V03:K1:vAWYUmEjxdinmVrh8PCq3cap/aeYN8SfFCFOiyoEn8IxAIXJBpG
 KZOmsYdEG/oZu9BwkiJPedWoYz5qiM0Ma8WwlWdZDSTNsjyh9gcRNh3okrsND0ITyXfLJ3g
 U1ehRfVoKQcw5CSID63J+2Nol7iQ/GeSKMMSiOT9JhEMaPnCn1kUrqMV42PajHhf1cCYp7J
 XK0T54zamNw4xc/8A029Q==
UI-OutboundReport: notjunk:1;M01:P0:2b2XSI1oyPc=;X/vtm9gC9ld6Bw4MZ2uXSBNkyuL TgKgeflSWztCEg1HTCxT+A1ShfehawgqI6jJ/tsR5zFtVURK/zSzSFy6nfT4rlC8LtDi5npbe +boCJOyEv3u8gK2Vz2SIBgXPCEh20xEbBe2HUuoYCZq/asD1sxJIR8hZ8m0CoMWTOddtfGI8k 0sItdesrtrR4lrZcPnZWi2tg0YzXiaAI+UaD+0TymLj/MdKSWWw8b3TQQ3yvtkpYphpADPU9/ iEP3XfI/8H8xQvkLssOpnRKERkxUwueU4lu6m33CsEHUfrPEPAmavzGzRxsu9jSKlvx27ElNp AQPa7ENwwOYFXcwBOzEPPIB9ERj4YvPiqK2MUa15QwysQwowmewlMXHhjMfLyqd1963NeKSCB 7HPpZ6QQd/LOf33lRcBkMvE83QUVKYYBOCXsUYgGB+BhLaM3Tuj+9ma7541vpnQxWc21wf0w7 97DSSV3uqDsEF4CyCicJhqzMkVJY5xYJlF8IbU9Na7UmH/0M4oyi8KHcPtWkOwgzQztL7Y3O0 EbXS6/JP3GgmUZ5h1teFiKo8+jmOcRGw+a4CASIxOInEjYDD7BqyOV0nsru5fUZt48wc/9kzj MbWAMS8APj1MKvhYxMLpKzPs5Eq0We40qDnhIRhtiFtfntmaXxkqMrxQ10HvfU4C2uIqQOwlu 38KkzDq/GVr44jNWqa9xSfK460RDmC4lx5VUEZTJf68IQwoaaXSKPOSLqRPKqX0GGr4B5LedS z3/koG/8ry+y6O+QcHIruu+kMImAec8muVdmpQckwso6qLj36AuiXe/oQthVnjR3X6/EZ56X5 KarUG8fha6aUJNjPxSId6YxwDNQTW/p+u5lphI7uWwbavfRbl7aGW2gJpb25Xne8zQ66iydRu 0tSimvDOB7d/MZKATHfwY3Uq8dFFJybHQnGnu08FtY46pTWEoSrEdkwpxOMFYa3pNBlD3rLEG gpTk3bAqDpf+gwCvx99I7mCop2xctEEVv8LWdx5n1PcaKT2X2jUwpQIsuTBPPW5ZJC5fnN6H7 kSNgD3HfLHNjuSdkV5vEX5rOEH2bVDw0bwsCLzqOM+u5Wg0/mHHEvqken0lnL0Q4ytZE5hYcz dWYiH8jDRqe2t1txeIJz6MB2/YoGwyJMBIOEmS/geAkyg+jy4SAjOlPoGia9+CEGj2JzjlkjA hIylHn7dLgF5KWnMd/W0oz0stOqpea7vZIDZut/iBmmKCKo1BCiFG+/dS8M1QnStXGpYz7yS6 iB3nBINwwUMb653e+QmlpEnEqWQwKDLfvC1oqx4wYaTgX6C4WhCmfDk68Gk8BgzH5C3X7Khgn NpRHy2lHQqglREP8anP6SQoN7HaL5pLxJ6XlcJYgl3iTOirS3+Iq6yUvs5eF5Uavgx05Al47S L3lZyfJ92yJmOMd5lApsROxwuNgrL2e+9Fkk3GcorIqXtvSGezkb+9CQM/G0XmR6jP3ANwwUH fEMHWswtnmFuLE/wGJ5F4WFFhl2RVIJ2v71x8a1hRog6+KhLZhWgkOpR/vPAuq/tP8zaYJ2BT NowluvWI2prp9ABZDY40u5dDvfmXelBUExguok0e2YiwBIMVBq+ELkDAG7dz3NGHUzd5VWKUk H7L0Hk3z3QgNki6sbkNkNNeH1ctTe9aswAFoQFTAN0YyKEGiqQ2Pqsg1ZnaQFaqkW+IkpwxQh 7iPjBZT1k9nvqCVP7WbShPvOmUzJQThsuxH7of5nAMWbYGwLUIRycFFYU1rhxMZEVqJ2iLIC1 B+yQ1WW7fgxsFhjMzxQuuVYv1YL3+z7Em431EDhRqJuL+71Qz8pStgXotBpiFNcvpCKeMnI5r CZG0MoPudxfB+WoHVODnWL9p2TYPer6MxI4fmbtqQ0jm5udRhW886K0U+nAfHE773Rs8l0AQy 1ToB+Co4ScFPqbJE2Y3z43XA2FoF87+nyfV1Q6oaJUDqF3IGzIq8gBhTzGf7akcaEuO9pBCuQ vCY1I5ZVRndvNXax8O7c3siI2jys4/bYD2VjuivPPkoogROw0ICfCWIy+N0V7J2jCF+G4rzIR c4pFqwdEkIhAT9rKv4EHx+/9HioDS3j6DNnUmMbEAGfAxK+QhXki0+MlVTmPYnXoxZuTw8q06 4mM1De3JgtgQGYJBrm5qvuKvmj3pFxASTyGgE7n5Iwf7u5MjoOk6v/JXkrmF/Lnj2Fs4rj5zI hjEVcdCSyLqqfQzuG0nDrpV4t9HcWfe5tjfZGo5duhZUAdXFkfj4q5nge0S4FCxBdg9A5n5SO sKkiXnWtJ1Huh4Y5T72Wlx+OKy22rozNS0DUXZP9oVmtZAHBVioCDzlYTp/cHaxCDYQul3fII Ie7/2XSHVrMPKMZGZr8q8On+9Eoj0P6RP/tzcahbsnvJcTjc2kleLB5oHk/35LNVa56GjNc3Y 9XffjakzUhCRELVrkeEQY7KtkVAYdupMEh7dkVnBksU/96JcSS2IH04SxIEed730pDxGMUsJY O/lM80z4tLiVmyvx3CMjeMT3b12DC/pgi7zVEKfsgK+re03gbuiRBxtDYs+ZNI9GI3pb/mmBo /M85BbAfy7Q6Z4hH23TIBRhRPWoVvzvnWGoQDeEWgS1J63DWttEneD0egoL5sQw2JxyW5HKXy RRV837QHOGV8tWfGCYAAKO12mqYFOzEhshdg2AyC3p45/x1Kn5kPSV0jcDLrvWy0Mou4WRldb WalXDh75SBDIFLwN3BLvcFF3i8eQS2ngPu9cNzk3usDQ801+kHljaX10wJvoMagVNyS245iXd VkRko5DEBUK68e+JzhQOq2D2IMEm8qj1TArIDs25EiKZVRdHFNaWM2+tod3m7dYFLPF3DlSba qT1zS2LBoBJYjt3+8NpUENi2eDoXffQVzDk8pDFlh54nlkp5DQXZZ34yfLnPGmUBHTEIxfneg GMV91je+pgNYhG0kD3nVXF1ka0eSK//UQzFUA49tHqEuL4f9IHa4eE5//W300N/xv3SSRi7iC Y7ShJV3Q+AzLNrQEu4jFkW3GxKe6GQTOgcqbsKE7sLtPCmQyOosl3Wk9PaZBRZ4NTp7bU2He7 qlw4Rf3C/2wSUrZ/CW3aTnkYoFW7HQQPLiKmV81HOBgm/EF3MSpd8nNbKohNMA9O/A3FUNvCE 3CcZbeRV8lFqATRQfYEMQbUYy9nhsoCoEILHnbgwNWzTWICAN3dep1Oe3b+Yh7xZLoNZ6ZgaE BmpqRp2hTuiLI3NAbv+FZIlGVH2XPu+i1gkTz5Ghw+Ua7Jl2XxfoyvsoCwJrJVNSPsvM9c551 4oImpxTNXHuutYafBH7jOFP/y1GZNx8hEatPH8RL+SLnjK4+Pf2VnaxaPlAh1rLswb9l+be9+ RyFkIGsOqIy1NSFR6euOCrabRTaxSRwMMj4Huiuj0I6QNd6Og5PCki6C2Ld6iFoHV4xsv2m8u sAZTLeCc0MZdft/UCJbNxfpRyJGCKGCytJ6jOcg5upa7Kl8pVA8JSbVAQxAp1qX+K6rPjIeKd 5jGHftgSmS1f3jc/ur9wAmSuQgWDOB2x02r8NxW4RrdPLrt1LsKH7xXktvw57ffec2zEjHcMT 00yS72AxSACqcApDikFlIzYsC0+PkMe3MXQAkSWJSP1H+vrfairo9Eh5AzhaL+MitkFlC5G4/ Y4ocl8SCGZoqst1YFma7flaApgjigkG43lYZAlkyGTMMkw4tGadSez9XsKxEau2r0qTX6Bdq0 F33heT1apiC5KN2efrVNlglTxekWuKdtqd50znXSKbZrTxKnN5VVTiU1ayUFvKRIH5RMqJm4T IzVM4PH3WL5kbOrkTfxe5Aik7DDo6eBfujRLh5d9nJeSfULxYTU+aT1ZdrZhQtlkE3BmyrRSH rBOAYK6FVd2yHhQTMkJSTGTLFL9Pji1vjQ1VYD22Z0AxcEltJBB8HxEebjbQD9tXaoedrazjT
 zivbAEWQDWc95rFvOvw0k0p/zKfmDs6rR01ta9suy5HfzmI3xF9HfX/S1g3AHZR3LedK50UIT ghtJZa+tVHqQpnZ6x7QSHpHKM3Ano4/qNvpCTN0dNqopH9wEpRGY08X5urxFXJPJQyDpODQVs ujV8MVBudCQIM8mg2iIXIGP0DD5issA/UJ1+A6FMNr1X5g455IOuQ/Q/OW/p32ED5qGomLzMf SCc4xlgJHCJHpEkPXHVCL60U7NYZLG+VwdWqGYiCGOdbV5XZgRSR8g1Z48fajmZ1MU5QOdiyO rV0XnUkKISBeLeIUXroqWrflKIZAEJBvanu8rlJdbcy/M+LF90EhBd8N6HkiLCyiTeVT/GvtS 9EIGq/WeezSHaxqduRDHBPvmu/5BiOrID87gED+zI6SBSa/O1koTdgccO97HY+jxU394O8Qjs jOOmid8dbyUalQX6wKUT1zpk1gWj2oC/p6y8FYEZva9fN6xYcNZOURld/pYuiUDdK4XDxEqWS CK49253yvdIO76zRn7/dMh7XpdPoEYEhgaz1QyUmwmMJUbO6urL21ea21fOJ4qasFqFVtna3D JQkJsh/EnLcNFJS//FEIE9mCGFU2hgBjlv/hmxWtZSEQ9bV1ydtpkwLV5gq7npV1HBWmdA6sJ 6/Ua1wnFw42R7iTzykTiFV4/or0gKIHMCLzXFjRkhtyc4OfzKywGGMWxrL4HebHYzbfUP7VX3 Kb+u0BqbTx4Uc9ZQhJRKjt8vwv6fr1E8ZyPkcLr1welda1OvgzvKF383cXK5YisPv2JtnvAzV xWjnH2XkNToutWOOQ1KbHmz5u6oITX+INWEF7C/YLgXXZC95E5UmmhekyU1MyMhEGFItw+3w+ 0dqblpDAgp64R1cViedJanX3u6dP479XuPqxgQU4/o9rH4yesGxP3GCEObGxq4StG1/yBHOnK 4sIbWi7qNXqFFpzwOMW7bJ0uFUgt7LtgoS+dYRADv94q9NuzfVpIXJF3hBt2XhUtUUHlCdR/w F4N/C/XwY+L6p2/g/zOG0ZPOddrKvpXjg/Sm+kE4UqE2IEicJjUrYaRVL1aXKBI+3AZGw0VIK zb+fGaEcMa8dN+ErAO6gW2/3QgC3II/vO4yxa5vGCDcvptLaoftOhwAPfLYn/ZvDFHMfuSwar 2euLbsbDTUZ6/ruGzqpCWxi57ADQvDMwXzAtfiUktmEtAxjKoLUM9/0WO1NifbpHQiN3vl4qa AfU42MtadJSRQfCgvg8PUviGsurmEAyGth1tOupKOPV5OP49Yn3nsA/3okLhmY6g5yy06WLbv Utj4yzya2Bc+aWHFMFoJQwpxYBtf7+KbPXiFHHGcwY1l87XI3/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_022200_771679_234079AE 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Feb 2026 10:16:50 +0100

Use an additional label so that a bit of common code can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/i3c/master/dw-i3c-master.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d87bde3f7700..beb40d947e6e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1113,8 +1113,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
-		dw_i3c_master_free_xfer(xfer);
-		return ret;
+		goto free_xfer;
 	}
 
 	for (i = 0; i < i2c_nxfers; i++) {
@@ -1144,10 +1143,10 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
+	pm_runtime_put_autosuspend(master->dev);
 	ret = xfer->ret;
+free_xfer:
 	dw_i3c_master_free_xfer(xfer);
-
-	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
 
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
